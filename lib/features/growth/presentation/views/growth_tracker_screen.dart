/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
import 'package:rafiq_app/features/growth/presentation/cubit/growth_cubit.dart';
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
    return BlocProvider(
    create: (_) => context.read<GrowthCubit>()..getGrowthRecords("CHILD_ID"),
      child: Scaffold(
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
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
import 'package:rafiq_app/core/di/di.dart';
import 'package:rafiq_app/features/growth/presentation/cubit/growth_cubit.dart';
import 'package:rafiq_app/features/growth/presentation/cubit/growth_state.dart';
import 'package:rafiq_app/features/growth/data/models/growth_record_response.dart';
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
    return BlocProvider(
      create: (_) =>
        getIt<GrowthCubit>()..getGrowthRecords("CHILD_ID"),
      child: Scaffold(
        body: AppGradientBackground(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                47.h.verticalSpace,
                const GrowthAppBar(title: 'Growth Tracker'),
                Expanded(
                  child: BlocBuilder<GrowthCubit, GrowthState>(
                    builder: (context, state) {
                      if (state is GrowthLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is GrowthError) {
                        return Center(child: Text(state.error.message));
                      }

                      if (state is GrowthLoaded) {
                        final List<GrowthRecordResponse> records =
                            state.records;

                        if (records.isEmpty) {
                          return const Center(child: Text("No data yet"));
                        }

                        /// sort by date
                        records.sort((a, b) =>
                            a.measurementDate.compareTo(b.measurementDate));

                        final latest = records.last;

                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              const BabyInfoCard(),
                              26.h.verticalSpace,

                              /// ✅ Summary dynamic
                              GrowthSummaryCard(record: latest),
                              26.h.verticalSpace,

                              /// ✅ Chart dynamic
                              GrowthChart(records: records),
                              30.h.verticalSpace,

                              /// ✅ Timeline dynamic
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const GrowthTimelineHeader(),
                                  ...records.map((record) {
                                    return GrowthTimelineItem(
                                      title: "Record",
                                      author: "User",
                                      weight: "${record.weightKg} Kg",
                                      height: "${record.heightCm} cm",
                                      date: record.measurementDate
                                          .toString()
                                          .split(" ")
                                          .first,
                                      time: "",
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