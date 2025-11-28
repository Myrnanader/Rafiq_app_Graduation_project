import 'package:flutter/material.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';

class CustomWeeksScroller extends StatefulWidget {
  const CustomWeeksScroller({super.key});

  @override
  State<CustomWeeksScroller> createState() => _CustomWeeksScrollerState();
}

class _CustomWeeksScrollerState extends State<CustomWeeksScroller> {
  final List<int> weeks = List.generate(40, (index) => index + 1);

  int selectedWeek = 2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: weeks.length,
        separatorBuilder: (_, __) => 18.pw,
        itemBuilder: (context, index) {
          bool isSelected = weeks[index] == selectedWeek;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedWeek = weeks[index];
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              margin: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary
                    : AppColors.lightBackground,
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 2.0,
                    spreadRadius: 0.10,
                    offset: const Offset(0, 3.5),
                  ),
                ],
              ),
              child: Text(
                "Week\n${weeks[index]}",
                textAlign: TextAlign.center,
                style: AppTextStyles.font12Regular.copyWith(
                  color: isSelected
                      ? AppColors.lightBackground
                      : AppColors.neutralGray,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
