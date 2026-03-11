import 'package:flutter/material.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

class ExerciseTabBar extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final Function(int) onTabSelected;

  const ExerciseTabBar({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        itemBuilder: (_, index) {
          final isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () => onTabSelected(index),
            child: Container(
              width: 120,
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                left: index == 0 ? 16 : 8,
                right: index == tabs.length - 1 ? 16 : 0,
              ),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.primary),
              ),
              child: Text(
                tabs[index],
                style: AppTextStyles.font14Regular.copyWith(
                  color: isSelected
                      ? AppColors.lightBackground
                      : AppColors.primary,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
