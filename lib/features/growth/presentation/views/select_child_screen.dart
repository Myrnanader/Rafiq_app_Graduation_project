import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/features/growth/presentation/cubit/children_cubit.dart';
import 'package:rafiq_app/features/growth/presentation/widgets/child_card.dart';
import 'package:rafiq_app/core/di/di.dart';

class SelectChildScreen extends StatelessWidget {
  const SelectChildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ChildrenCubit>()..getChildren(),
      child: Scaffold(
        body: AppGradientBackground(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                60.h.verticalSpace,

                /// Title
                const Text(
                  "Select Your Child",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                24.h.verticalSpace,

                /// Content
                Expanded(
                  child: BlocBuilder<ChildrenCubit, ChildrenState>(
                    builder: (context, state) {
                      if (state is ChildrenLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (state is ChildrenError) {
                        return Center(child: Text(state.message));
                      }

                      if (state is ChildrenSuccess) {
                        return ListView.builder(
                          itemCount: state.children.length,
                          itemBuilder: (_, index) {
                            final child = state.children[index];

                            return ChildCard(
                              child: child,
                              onTap: () {
                                /// 🔥 DEBUG
                                print("🔥 Selected childId: ${child.id}");

                                /// 🔥 نروح للـ Growth
                                context.go(
                                  AppRoutes.growthTrackerScreen,
                                  extra: child,
                                );
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
          ),
        ),
      ),
    );
  }
}