import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/helpers/extensions.dart';
import '../../../core/theme/app_texts/app_text_styles.dart';
import '../../../core/theming/app_colors.dart';
import '../widgets/widgets/exercise_card.dart';
import '../widgets/widgets/exercise_data.dart';
import '../widgets/widgets/exercise_tab_bar_widget.dart';

class ExerciseScreen extends StatefulWidget {
  const ExerciseScreen({super.key});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  int _selectedTabIndex = 0;

  final List<String> _tabs = [
    "1st Trimester",
    "2st Trimester",
    "3st Trimester",
    "4st Trimester",
    "5st Trimester",
  ];

  List _getExercisesForTab() {
    switch (_selectedTabIndex) {
      case 0:
        return firstTrimester;
      case 1:
        return secondTrimester;
      case 2:
        return thirdTrimester;
      case 3:
        return fourthTrimester;
      case 4:
        return fifthTrimester;
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightSurface,
      appBar: AppBar(
        backgroundColor: AppColors.lightSurface,
        leading: Column(
          children: [
            5.ph,
            IconButton(
              onPressed: () => GoRouter.of(context).pop(),
              icon: SvgPicture.asset(
                "assets/icons/back_arrow.svg",
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                  AppColors.onPrimaryFixed,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
        title: Column(
          children: [
            25.ph,
            Text(
              "Exercise",
              style: AppTextStyles.font20SemiBold.copyWith(
                color: AppColors.onPrimaryFixed,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        20.ph,
        ExerciseTabBar(
          tabs: _tabs,
          selectedIndex: _selectedTabIndex,
          onTabSelected: (index) {
            setState(() {
              _selectedTabIndex = index;
            });
          },
        ),
        15.ph,
        Expanded(
          child: Builder(
            builder: (_) {
              final exercise = _getExercisesForTab();

              return exercise.isEmpty
                  ? const Center(
                child: Text("No exercise data for this month."),
              )
                  : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: exercise.length,
                itemBuilder: (_, index) => ExerciseCard(
                  exercise: exercise[index],
                ),
              );
            },
          ),
        ),

      ]),    );
  }
}
