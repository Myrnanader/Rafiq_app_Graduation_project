import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../auth/presentation/cubit/user_cubit.dart';
import '../cubit/exercise_cubit.dart';
import '../cubit/exercise_state.dart';
import '../widgets/widgets/exercise_card.dart';
import '../widgets/widgets/exercise_tab_bar_widget.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  int _selectedTabIndex = 0;

  final List<String> _tabs = [
    "1st Trimester",
    "2nd Trimester",
    "3rd Trimester",
  ];

  final List<int> _trimesterValues = [1, 2, 3];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ExercisesCubit>().getByTrimester(1);
    });
  }

  void _onTabChanged(int index) {
    setState(() => _selectedTabIndex = index);

    final trimester = _trimesterValues[index];

    context.read<ExercisesCubit>()
      ..setTrimester(trimester)
      ..getByTrimester(trimester);  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightSurface,

      appBar: AppBar(
        backgroundColor: AppColors.lightSurface,
        leading: IconButton(
          onPressed: () => GoRouterHelper(context).pop(),
          icon: SvgPicture.asset(
            "assets/icons/back_arrow.svg",
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(
              AppColors.onPrimaryFixed,
              BlendMode.srcIn,
            ),
          ),
        ),
        title: Text(
          "Exercises",
          style: AppTextStyles.font20SemiBold.copyWith(
            color: AppColors.onPrimaryFixed,
          ),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          20.ph,

          /// Tabs
          ExerciseTabBar(
            tabs: _tabs,
            selectedIndex: _selectedTabIndex,
            onTabSelected: _onTabChanged,
          ),

          15.ph,

          /// Data
          Expanded(
            child: BlocBuilder<ExercisesCubit, ExercisesState>(
              builder: (context, state) {
                if (state is ExercisesLoading) {
                  return const Center(child: CircularProgressIndicator(color: AppColors.lavender,));
                }

                if (state is ExercisesError) {
                  return Center(child: Text(state.message));
                }

                if (state is ExercisesLoaded) {
                  final exercises = state.exercises;

                  if (exercises.isEmpty) {
                    return const Center(child: Text("No exercises available"));
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: exercises.length,
                    itemBuilder: (_, index) {
                      final item = exercises[index];

                      return ExerciseCard(
                        exercise: item,
                        onDelete: () async {
                          await context.read<ExercisesCubit>().deleteExercise(item.id);
                          if (context.mounted) {
                            context.read<ExercisesCubit>().getByTrimester(
                              context.read<ExercisesCubit>().currentTrimester,
                            );
                          }
                        },
                      );
                    },
                  );
                }

                return const SizedBox();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: BlocBuilder<UserCubit, UserState>(
        builder: (context, userState) {
          if (userState is UserLoaded && userState.profile.role == "Admin") {
            return FloatingActionButton(
              backgroundColor: AppColors.primary,
              shape: CircleBorder(),
              onPressed: () async {
                await context.push(AppRoutes.addExerciseScreen);
                if (context.mounted) {
                  context.read<ExercisesCubit>().getByTrimester(
                      context.read<ExercisesCubit>().currentTrimester
                  );
                }
              },
              child: const Icon(Icons.add, color: AppColors.lightBackground),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
