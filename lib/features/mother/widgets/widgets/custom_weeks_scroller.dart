import 'package:flutter/material.dart';
import 'package:rafiq_app/core/storage/shared_prefs_service.dart';
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
  late int selectedWeek;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    final savedWeek = SharedPrefsService.getPregnancyWeek();

    /// ✅ لو مفيش week نخليه 0 (مش 1)
    selectedWeek = savedWeek ?? 0;

    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (selectedWeek > 0 && _scrollController.hasClients) {
        final offset = (selectedWeek - 1) * 74.0;
        _scrollController.jumpTo(
          offset.clamp(0, _scrollController.position.maxScrollExtent),
        );
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///  لو مفيش week → منعرضش الـ widget أصلاً
    if (selectedWeek == 0) {
      return const SizedBox();
    }

    return SizedBox(
      height: 84,
      child: ListView.separated(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: weeks.length,
        separatorBuilder: (_, _) => 18.pw,
        itemBuilder: (context, index) {
          final bool isSelected = weeks[index] == selectedWeek;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedWeek = weeks[index];
              });
            },
            child: Container(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 18,
                bottom: 0,
              ),
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