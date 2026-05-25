import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';
import '../cubit/memory_cubit.dart';
import '../widgets/widgets/custom_memory_card.dart';

class MemoriesScreen extends StatefulWidget {
  const MemoriesScreen({super.key});

  @override
  State<MemoriesScreen> createState() => _MemoriesScreenState();
}

class _MemoriesScreenState extends State<MemoriesScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MemoriesCubit>().getMemories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightSurface,
      appBar: AppBar(
        backgroundColor: AppColors.lightSurface,
        leading: IconButton(
          onPressed: () => context.pop(),
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
          "Memories",
          style: AppTextStyles.font20SemiBold.copyWith(
            color: AppColors.onPrimaryFixed,
          ),
        ),
        centerTitle: true,
      ),

      body: BlocBuilder<MemoriesCubit, MemoriesState>(
        builder: (context, state) {
          if (state is MemoriesLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is MemoriesSuccess) {
            if (state.memories.isEmpty) {
              return Center(child: Text("No memories yet",
                style: AppTextStyles.font16Medium.copyWith(
                  color: AppColors.midNight,
                ),
              ));
            }

            return ListView.builder(
              padding: const EdgeInsets.only(top: 20),
              itemCount: state.memories.length,
              itemBuilder: (context, index) {
                final memory = state.memories[index];

                return CustomMemoryCard(
                  memory: memory,
                  onDelete: () {
                    context
                        .read<MemoriesCubit>()
                        .deleteMemory(memory.id);
                  },
                );
              },
            );
          }

          if (state is MemoriesError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
