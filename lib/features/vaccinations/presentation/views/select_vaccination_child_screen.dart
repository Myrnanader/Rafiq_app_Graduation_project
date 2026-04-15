import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/features/findaDoctorNow/widgets/growth_app_bar.dart';
import 'package:rafiq_app/features/growth/presentation/cubit/children_cubit.dart';
import 'package:rafiq_app/features/growth/presentation/widgets/child_card.dart';
import 'package:rafiq_app/core/di/di.dart';

class SelectVaccinationChildScreen extends StatelessWidget {
  const SelectVaccinationChildScreen({super.key});

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
                47.h.verticalSpace,
                ///  App Bar
                GrowthAppBar(
                  title: "Vaccinations child",
                  onBack: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go(AppRoutes.dashboardScreen);
                    }
                  },
                ),
                24.h.verticalSpace,
                ///  Content
                Expanded(
                  child: BlocBuilder<ChildrenCubit, ChildrenState>(
                    builder: (context, state) {
                      /// Loading
                      if (state is ChildrenLoading) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        );
                      }

                      /// Error
                      if (state is ChildrenError) {
                        return Center(child: Text(state.message));
                      }

                      /// Success
                      if (state is ChildrenSuccess) {
                        return ListView.separated(
                          itemCount: state.children.length,
                          separatorBuilder: (_, _) =>
                              SizedBox(height: 12.h),
                          itemBuilder: (_, index) {
                            final child = state.children[index];
                            return ChildCard(
                              child: child,
                              onTap: () {
                                
                                context.push(
                                  AppRoutes.vaccinationsScreen,
                                  extra: child.id,    
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