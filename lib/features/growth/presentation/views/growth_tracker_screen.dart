import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
import 'package:rafiq_app/features/growth/presentation/widgets/growth_timeline_header.dart';
import '../widgets/growth_app_bar.dart';
import '../widgets/baby_info_card.dart';
import '../widgets/growth_summary_card.dart';
import '../widgets/growth_chart.dart';
import '../widgets/growth_timeline_item.dart';

class GrowthTrackerScreen extends StatelessWidget {
  const GrowthTrackerScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradientBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              47.h.verticalSpace,
              const GrowthAppBar(title: 'Growth Tracker'),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //16.h.verticalSpace,
                      /// Baby Info
                      const BabyInfoCard(),
                      26.h.verticalSpace,

                      /// Growth Summary
                      const GrowthSummaryCard(),
                      26.h.verticalSpace,

                      /// Chart
                      const GrowthChart(),
                      30.h.verticalSpace,

                      /// Timeline
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          GrowthTimelineHeader(),
                          GrowthTimelineItem(
                            title: 'Birth  Apr 20, 2024',
                            author: 'Sara Mohammed',
                            weight: '3.2 Kg',
                            height: '50 cm',
                            date: 'Apr 20, 2024',
                            time: '05:17 pm',
                          ),

                          GrowthTimelineItem(
                            title: '4 Months  Aug 20, 2024',
                            author: 'Sara Mohammed',
                            weight: '6 Kg',
                            height: '62 cm',
                            date: 'Aug 20, 2024',
                            time: '09:20 pm',
                          ),
                          GrowthTimelineItem(
                            title: '8 Months – Des 20, 2024',
                            author: 'Sara Mohammed',
                            weight: '8.2 Kg',
                            height: '70 cm',
                            date: 'Aug 20, 2024',
                            time: '09:20 pm',
                          ),
                          GrowthTimelineItem(
                            title: '1 Year Apr20, 2025',
                            author: 'Sara Mohammed',
                            weight: '9.5 Kg',
                            height: '75 cm',
                            date: 'Dec 20, 2025',
                            time: '09:20 pm',
                          ),
                        ],
                      ),
                      32.h.verticalSpace,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
