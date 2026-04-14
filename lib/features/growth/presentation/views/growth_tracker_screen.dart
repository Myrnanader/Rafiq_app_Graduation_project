
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
import 'package:rafiq_app/core/common/widgets/custom_button.dart';
import 'package:rafiq_app/core/di/di.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/features/auth/presentation/cubit/user_cubit.dart';
import 'package:rafiq_app/features/growth/data/models/child_response.dart';
import 'package:rafiq_app/features/growth/presentation/cubit/growth_cubit.dart';
import 'package:rafiq_app/features/growth/presentation/cubit/growth_state.dart';
import 'package:rafiq_app/features/growth/presentation/widgets/growth_timeline_header.dart';

import '../widgets/growth_app_bar.dart';
import '../widgets/baby_info_card.dart';
import '../widgets/growth_summary_card.dart';
import '../widgets/growth_chart.dart';
import '../widgets/growth_timeline_item.dart';

class GrowthTrackerScreen extends StatelessWidget {
  final ChildResponse child;

  const GrowthTrackerScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final userState = context.watch<UserCubit>().state;

    ///  FIX الاسم
    String motherName = "Mother";
    if (userState is UserLoaded) {
      motherName = userState.profile.fullName;
    }

    return BlocProvider(
      create: (_) => getIt<GrowthCubit>()..getGrowthRecords(child.id),
      child: Scaffold(
        body: AppGradientBackground(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                47.h.verticalSpace,

                GrowthAppBar(
                  title: 'Growth Tracker',
                  onBack: () => context.go(AppRoutes.selectChildScreen),
                ),

                Expanded(
                  child: BlocBuilder<GrowthCubit, GrowthState>(
                    builder: (context, state) {
                      /// ─── Loading ───
                      if (state is GrowthLoading) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        );
                      }

                      /// ─── Error ───
                      if (state is GrowthError) {
                        return Column(
                          children: [
                            const Spacer(),
                            Column(
                              children: [
                                Text(
                                  "No growth records yet",
                                  style: AppTextStyles.font14Medium,
                                ),
                                16.verticalSpace,
                                CustomButton(
                                  text: "Add Growth Record",
                                  color: AppColors.primary,
                                  textcolor: Colors.white,
                                  border: 16.r,
                                  hight: 50.h,
                                  isborder: false,
                                  isIcon: true,
                                  icon: Icons.add,
                                  onTap: () {
                                    context.push(
                                      AppRoutes.addGrowthScreen,
                                      extra: child.id,
                                    );
                                  },
                                ),
                              ],
                            ),

                            40.h.verticalSpace, 
                          ],
                        );
                      }

                      /// ─── Loaded ───
                      if (state is GrowthLoaded) {
                        ///  FIX الترتيب (الأحدث فوق)
                        final sortedRecords = [...state.records]
                          ..sort(
                            (a, b) =>
                                b.measurementDate.compareTo(a.measurementDate),
                          );

                        final latestRecord = state.latestRecord;

                        /// ─── Empty State ───
                        if (sortedRecords.isEmpty && latestRecord == null) {
                          return Column(
                            children: [
                              const Spacer(), 
                              Column(
                                children: [
                                  Text(
                                    "No growth records yet",
                                    style: AppTextStyles.font14Medium,
                                  ),
                                  16.verticalSpace,
                                  CustomButton(
                                    text: "Add Growth Record",
                                    color: AppColors.primary,
                                    textcolor: Colors.white,
                                    border: 16.r,
                                    hight: 50.h,
                                    isborder: false,
                                    isIcon: true,
                                    icon: Icons.add,
                                    onTap: () {
                                      context.push(
                                        AppRoutes.addGrowthScreen,
                                        extra: child.id,
                                      );
                                    },
                                  ),
                                ],
                              ),

                              40.h.verticalSpace,  
                            ],
                          );
                        }

                        ///  للشارت (لازم ascending)
                        final chartRecords = [...state.records]
                          ..sort(
                            (a, b) =>
                                a.measurementDate.compareTo(b.measurementDate),
                          );

                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              /// ─── Baby Info ───
                              BabyInfoCard(child: child),
                              26.h.verticalSpace,

                              /// ─── Summary ───
                              if (latestRecord != null)
                                GrowthSummaryCard(record: latestRecord)
                              else if (chartRecords.isNotEmpty)
                                GrowthSummaryCard(record: chartRecords.last),

                              26.h.verticalSpace,

                              /// ─── Chart ───
                              GrowthChart(records: chartRecords),

                              30.h.verticalSpace,

                              /// ─── Timeline ───
                              if (sortedRecords.isNotEmpty)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const GrowthTimelineHeader(),

                                    ...sortedRecords.asMap().entries.map((
                                      entry,
                                    ) {
                                      final index = entry.key;
                                      final record = entry.value;
                                      final isLast =
                                          index == sortedRecords.length - 1;

                                      return GrowthTimelineItem(
                                        title:
                                            "Record ${sortedRecords.length - index}",

                                        author: motherName,

                                        weight: "${record.weightKg} Kg",
                                        height: "${record.heightCm} cm",

                                        date: record.measurementDate
                                            .toString()
                                            .split(" ")
                                            .first,

                                        time: "",
                                        isLast: isLast,
                                      );
                                    }),
                                  ],
                                ),

                              32.h.verticalSpace,
                            ],
                          ),
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
