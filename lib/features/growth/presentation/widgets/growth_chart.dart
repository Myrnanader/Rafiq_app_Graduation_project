/*import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/features/growth/presentation/widgets/growth_chart_legend.dart';

class GrowthChart extends StatelessWidget {
  const GrowthChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: double.infinity,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// ===== Title =====
          Text(
            'Baby Growth Over Time',
            style: AppTextStyles.font16Medium.copyWith(
              color: AppColors.onPrimary,
            ),
          ),

          20.h.verticalSpace,

          /// ===== Chart =====
          Expanded(
            child: Stack(
              children: [
                LineChart(_chartData()),

                /// ===== Legend =====
                Positioned(
                  top: 0.h,
                  left: 40.w,
                  child: const GrowthChartLegend(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  LineChartData _chartData() {
    return LineChartData(
      minX: 0,
      maxX: 16,
      minY: 0,
      maxY: 70,

      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        drawHorizontalLine: true,
        horizontalInterval: 10,
        getDrawingHorizontalLine: (value) =>
            FlLine(color: AppColors.secondaryGray, strokeWidth: 1),
        getDrawingVerticalLine: (value) =>
            FlLine(color: AppColors.secondaryGray, strokeWidth: 1),
      ),

      titlesData: FlTitlesData(
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),

        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 2,
            reservedSize: 36.h,
            getTitlesWidget: (value, _) {
              return Text(
                value.toInt().toString(),
                style: AppTextStyles.font12Regular,
              );
            },
          ),
          axisNameWidget: Text(
            'Age (months)',
            style: AppTextStyles.font12Regular.copyWith(
              color: AppColors.onPrimary,
            ),
          ),
        ),

        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 10,
            //reservedSize: 36.h,
            getTitlesWidget: (value, _) {
              if (value < 10) {
                return const SizedBox.shrink();
              }
              return Text(
                value.toInt().toString(),
                style: AppTextStyles.font12Regular,
              );
            },
          ),

          axisNameWidget: Text(
            'Measurements',
            style: AppTextStyles.font12SemiBold.copyWith(
              color: AppColors.onPrimary,
            ),
          ),
        ),
      ),

      borderData: FlBorderData(
        show: true,
        border: const Border(
          left: BorderSide(color: Colors.black, width: 1.5),
          bottom: BorderSide(color: Colors.black, width: 1.5),
        ),
      ),

      lineBarsData: [
        /// ===== Height Line =====
        LineChartBarData(
          spots: const [
            FlSpot(1, 50),

            FlSpot(4, 60),
            FlSpot(8, 67),
            FlSpot(12, 69),
            FlSpot(16, 70),
          ],
          isCurved: true,
          color: AppColors.onBackgroundSecondary,
          barWidth: 2,
          dotData: const FlDotData(show: true),
        ),

        /// ===== Weight Line =====
        LineChartBarData(
          spots: const [
            FlSpot(1, 3),

            FlSpot(4, 9),
            FlSpot(8, 11),
            FlSpot(12, 12),
            FlSpot(16, 13),
          ],
          isCurved: true,
          color: AppColors.onPrimary,
          barWidth: 2,
          dotData: const FlDotData(show: true),
        ),
      ],
    );
  }
}
*/
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/features/growth/data/models/growth_record_response.dart';
import 'package:rafiq_app/features/growth/presentation/widgets/growth_chart_legend.dart';

class GrowthChart extends StatelessWidget {
  final List<GrowthRecordResponse> records;

  const GrowthChart({
    super.key,
    required this.records,
  });

  /// 🔥 نحسب العمر بالشهور
  double _getMonthIndex(DateTime date, DateTime firstDate) {
    return date.difference(firstDate).inDays / 30;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: double.infinity,
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Baby Growth Over Time',
            style: AppTextStyles.font16Medium.copyWith(
              color: AppColors.onPrimary,
            ),
          ),
          20.h.verticalSpace,
          Expanded(
            child: Stack(
              children: [
                LineChart(_chartData()),
                Positioned(
                  top: 0.h,
                  left: 40.w,
                  child: const GrowthChartLegend(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  LineChartData _chartData() {
    List<FlSpot> heightSpots = [];
    List<FlSpot> weightSpots = [];

    /// 🔥 أهم سطر
    final firstDate = records.first.measurementDate;

    for (final record in records) {
      final x = _getMonthIndex(record.measurementDate, firstDate);

      heightSpots.add(FlSpot(x, record.heightCm));
      weightSpots.add(FlSpot(x, record.weightKg));
    }

    return LineChartData(
      minX: 0,
      maxX: 16, // زي التصميم بالظبط
      minY: 0,
      maxY: 70,

      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        drawHorizontalLine: true,
        horizontalInterval: 10,
        getDrawingHorizontalLine: (value) =>
            FlLine(color: AppColors.secondaryGray, strokeWidth: 1),
        getDrawingVerticalLine: (value) =>
            FlLine(color: AppColors.secondaryGray, strokeWidth: 1),
      ),

      titlesData: FlTitlesData(
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),

        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 2,
            reservedSize: 36.h,
            getTitlesWidget: (value, _) {
              return Text(
                value.toInt().toString(),
                style: AppTextStyles.font12Regular,
              );
            },
          ),
          axisNameWidget: Text(
            'Age (months)',
            style: AppTextStyles.font12Regular.copyWith(
              color: AppColors.onPrimary,
            ),
          ),
        ),

        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 10,
            getTitlesWidget: (value, _) {
              if (value < 10) return const SizedBox.shrink();
              return Text(
                value.toInt().toString(),
                style: AppTextStyles.font12Regular,
              );
            },
          ),
          axisNameWidget: Text(
            'Measurements',
            style: AppTextStyles.font12SemiBold.copyWith(
              color: AppColors.onPrimary,
            ),
          ),
        ),
      ),

      borderData: FlBorderData(
        show: true,
        border: const Border(
          left: BorderSide(color: Colors.black, width: 1.5),
          bottom: BorderSide(color: Colors.black, width: 1.5),
        ),
      ),

      lineBarsData: [
        LineChartBarData(
          spots: heightSpots,
          isCurved: true,
          color: AppColors.onBackgroundSecondary,
          barWidth: 2,
          dotData: const FlDotData(show: true),
        ),
        LineChartBarData(
          spots: weightSpots,
          isCurved: true,
          color: AppColors.onPrimary,
          barWidth: 2,
          dotData: const FlDotData(show: true),
        ),
      ],
    );
  }
}