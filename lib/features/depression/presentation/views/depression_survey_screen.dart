import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import '../widgets/depression_app_bar.dart';
import '../widgets/depression_progress_bar.dart';
import '../widgets/depression_answer_option.dart';
import '../widgets/app_primary_button.dart';
import '../widgets/app_secondary_button.dart';

class DepressionSurveyScreen extends StatefulWidget {
  const DepressionSurveyScreen({super.key});

  @override
  State<DepressionSurveyScreen> createState() =>
      _DepressionSurveyScreenState();
}

class _DepressionSurveyScreenState extends State<DepressionSurveyScreen> {
  int currentIndex = 0;
  int selectedAnswer = -1;

  final List<String> questions = [
    'Little interest or pleasure in doing things',
    'Feeling down, depressed, or hopeless',
    'Trouble falling or staying asleep',
    'Feeling tired or having little energy',
    'Poor appetite or overeating',
    'Feeling bad about yourself',
    'Trouble concentrating',
    'Moving or speaking slowly',
    'Thoughts you would be better off dead',
  ];

  final List<String> answers = [
    'Not at all',
    'Several days',
    'More than half the days',
    'Nearly every day',
  ];

  void next() {
    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
        selectedAnswer = -1;
      });
    } else {
      context.go(AppRoutes.depressionResultScreen);
    }
  }

  void back() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        selectedAnswer = -1;
      });
    } else {
      context.go(AppRoutes.depressionStartScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradientBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DepressionAppBar(
                current: currentIndex + 1,
                total: questions.length,
                onBack: back,
              ),

              DepressionProgressBar(
                current: currentIndex + 1,
                total: questions.length,
              ),

              24.h.verticalSpace,

              Text(
                'Over the last 2 weeks, how often have you been bothered by any of the following problems?',
                style: AppTextStyles.font16SemiBold,
              ),

              74.h.verticalSpace,

              Text(
                '${currentIndex + 1}. ${questions[currentIndex]}',
                style: AppTextStyles.font14Medium.copyWith(
                  height: 1.4,
                  color: AppColors.onPrimaryFixed,
                ),
              ),

              16.h.verticalSpace,

              ...List.generate(
                answers.length,
                (index) => DepressionAnswerOption(
                  text: answers[index],
                  isSelected: selectedAnswer == index,
                  onTap: () {
                    setState(() {
                      selectedAnswer = index;
                    });
                  },
                ),
              ),

              const Spacer(),

              Row(
                children: [
                  Expanded(
                    child: AppSecondaryButton(
                      text: 'Back',
                      onPressed: back,
                    ),
                  ),
                  16.w.horizontalSpace,
                  Expanded(
                    child: AppPrimaryButton(
                      text: currentIndex == questions.length - 1
                          ? 'Finish'
                          : 'Next',
                      onPressed:
                          selectedAnswer == -1 ? null : next,
                    ),
                  ),
                ],
              ),

              96.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}