import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../auth/presentation/cubit/user_cubit.dart';
import '../cubit/food_cubit.dart';
import '../cubit/food_state.dart';
import '../widgets/widgets/food_card.dart';
import '../widgets/widgets/food_tab_bar_widget.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  int _selectedTabIndex = 0;
  String get _currentCategory => _tabs[_selectedTabIndex];

  final List<String> _tabs = ["Vegetables", "Proteins", "Fruits", "Dairy"];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FoodsCubit>().getByCategory(_tabs[0]);
    });
  }

  void _onTabChanged(int index) {
    setState(() => _selectedTabIndex = index);

    final selectedCategory = _tabs[index];
    context.read<FoodsCubit>().getByCategory(selectedCategory);
  }

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
          "Foods",
          style: AppTextStyles.font20SemiBold.copyWith(
            color: AppColors.onPrimaryFixed,
          ),
        ),
        centerTitle: true,
      ),

      body: Column(
        children: [
          20.ph,

          FoodTabBar(
            tabs: _tabs,
            selectedIndex: _selectedTabIndex,
            onTabSelected: _onTabChanged,
          ),

          15.ph,

          Expanded(
            child: BlocBuilder<FoodsCubit, FoodsState>(
              builder: (context, state) {
                if (state is FoodsLoading) {
                  return Center(child:
                      Lottie.asset("assets/animations/Heart_Loading.json"),
                  );
                }

                if (state is FoodsError) {
                  return Center(child: Text(state.message));
                }

                if (state is FoodsLoaded) {
                  final foods = state.foods;

                  if (foods.isEmpty) {
                    return const Center(
                      child: Text("No foods in this category"),
                    );
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: foods.length,
                    itemBuilder: (_, index) {
                      return BlocBuilder<UserCubit, UserState>(
                        builder: (context, userState) {
                          final isAdmin =
                              userState is UserLoaded &&
                                  userState.profile.role == "Admin";

                          return FoodCard(
                            food: foods[index],

                            onDelete: isAdmin
                                ? () async {
                              await context.read<FoodsCubit>().deleteFood(
                                foods[index].id,
                                _currentCategory,
                              );
                            }
                                : null, isAdmin: true,
                          );
                        },
                      );                    },
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
          // if (userState is UserLoaded && userState.profile.role == "Admin") {
            return FloatingActionButton(
              backgroundColor: AppColors.primary,
              shape: CircleBorder(),
              onPressed: () async {
                await context.push(AppRoutes.addFoodScreen);
                if (context.mounted) {
                  context.read<FoodsCubit>().getByCategory(_currentCategory);
                }
              },
              child: const Icon(Icons.add, color: AppColors.lightBackground),
            );
          // }

          // return const SizedBox.shrink();
        },
      ),
    );
  }
}
