
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/features/growth/data/models/growth_record_response.dart';
import 'package:rafiq_app/features/growth/presentation/widgets/growth_chart_legend.dart';

class GrowthChart extends StatelessWidget {
  final List<GrowthRecordResponse> records;

  const GrowthChart({super.key, required this.records});

  @override
  Widget build(BuildContext context) {
    if (records.isEmpty) return const SizedBox();

    return Container(
      height: 300.h,
      width: double.infinity,
      padding: EdgeInsets.all(8.w),
      child: Column(
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
                SizedBox(
                  width: _chartWidth(),
                  child: LineChart(
                    _chartData(),

                    ///  animation ()
                    duration: const Duration(milliseconds: 600),
                    curve: Curves.easeInOut,

                    ///  zoom + pan
                    transformationConfig: FlTransformationConfig(
                      scaleAxis: FlScaleAxis.horizontal,
                      minScale: 1,
                      maxScale: 3,
                      panEnabled: true,
                      scaleEnabled: true,
                    ),
                  ),
                ),

                Positioned(
                  top: 0,
                  left: 40,
                  child: const GrowthChartLegend(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///  عرض أقل = spacing أحلى
  double _chartWidth() {
    final count = records.length;
    final base = count < 16 ? 16 : count;
    return base * 25;    
  }

  LineChartData _chartData() {
    final sorted = [...records]
      ..sort((a, b) => a.measurementDate.compareTo(b.measurementDate));

    List<FlSpot> heightSpots = [];
    List<FlSpot> weightSpots = [];

    double minY = double.infinity;
    double maxY = double.negativeInfinity;

    for (int i = 0; i < sorted.length; i++) {
      final r = sorted[i];

      final x = i.toDouble();

      heightSpots.add(FlSpot(x, r.heightCm));
      weightSpots.add(FlSpot(x, r.weightKg));

      minY = [minY, r.heightCm, r.weightKg].reduce((a, b) => a < b ? a : b);
      maxY = [maxY, r.heightCm, r.weightKg].reduce((a, b) => a > b ? a : b);
    }

    minY = (minY - 5).clamp(0, double.infinity);
    maxY = maxY + 5;

    final count = sorted.length;
    final double maxX = count < 16 ? 16.0 : count.toDouble();

    return LineChartData(
      minX: 0,
      maxX: maxX,
      minY: minY,
      maxY: maxY,

      ///  Tooltip
      lineTouchData: LineTouchData(
        enabled: true,
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (spot) => Colors.black87,
          tooltipBorderRadius: BorderRadius.circular(8),
          getTooltipItems: (spots) {
            return spots.map((spot) {
              final record = sorted[spot.x.toInt()];
              final isWeight = spot.barIndex == 1;

              return LineTooltipItem(
                "${DateFormat.yMMMd().format(record.measurementDate)}\n"
                "${isWeight ? 'Weight' : 'Height'}: ${spot.y.toStringAsFixed(1)}",
                const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              );
            }).toList();
          },
        ),
      ),

      ///  Grid
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        drawHorizontalLine: true,
        verticalInterval: 2,
        horizontalInterval: 10, //  FIX (10-20-30)
        getDrawingHorizontalLine: (value) =>
            FlLine(color: AppColors.secondaryGray, strokeWidth: 1),
        getDrawingVerticalLine: (value) =>
            FlLine(color: AppColors.secondaryGray, strokeWidth: 1),
      ),

      ///  Axis
      titlesData: FlTitlesData(
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles:
            const AxisTitles(sideTitles: SideTitles(showTitles: false)),

        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 2,
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
            interval: 10, // 👈 FIX
            getTitlesWidget: (value, _) {
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

      ///  الخطوط (smooth + dots)
      lineBarsData: [
        LineChartBarData(
          spots: heightSpots,
          isCurved: true,
          color: AppColors.onBackgroundSecondary,
          barWidth: 3,
          dotData: const FlDotData(show: true),
          belowBarData: BarAreaData(
            show: true,
            color: AppColors.onBackgroundSecondary.withValues(alpha:0.1),
          ),
        ),
        LineChartBarData(
          spots: weightSpots,
          isCurved: true,
          color: AppColors.onPrimary,
          barWidth: 3,
          dotData: const FlDotData(show: true),
          belowBarData: BarAreaData(
            show: true,
            color: AppColors.onPrimary.withValues(alpha:0.1),
          ),
        ),
      ],
    );
  }
}