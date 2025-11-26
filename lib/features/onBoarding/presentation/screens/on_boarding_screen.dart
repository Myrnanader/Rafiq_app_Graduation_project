/*import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/core/utils/app_images.dart';
import 'package:rafiq_app/features/onBoarding/presentation/widgets/onboarding_page.dart';
import 'package:rafiq_app/features/onBoarding/presentation/widgets/onboarding_progress_arrow.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      OnboardingPage(
        imagePath: AppImages.sleepingBoy,
        title: "Understand your baby's cry",
        description:
            "Detect the reason behind each cry using AI-powered insights to help you respond with confidence.",
      ),
      OnboardingPage(
        imagePath: AppImages.mother1,
        title: "Take Care of Your Mental Health",
        description:
            "Track your mood and detect early signs of postpartum depression for better self-awareness.",
      ),
      OnboardingPage(
        imagePath: AppImages.motherAndBaby,
        title: "Find the safest delivery option",
        description:
            "Discover the safest delivery type for you, and get personalized tips for a secure, comfortable experience.",
      ),
    ];
  }

  void _nextPage() {
    if (_currentIndex < pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.go(AppRoutes.loginScreen);
    }
  }

  void _previousPage() {
    if (_currentIndex > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.onSecondary, AppColors.lightBackground],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              children: pages,
            ),
            Positioned(
              bottom: 74.h,
              left: 24.w,
              child: TextButton(
                onPressed: () {
                  context.go(AppRoutes.loginScreen);
                },
                child: Text(
                  "Skip",
                  style: AppTextStyles.font14SemiBold.copyWith(
                    color: AppColors.onPrimary,
                  ),
                ),
              ),
            ),
            if (_currentIndex > 0)
              Positioned(
                top: 50.h,
                left: 24.w,
                child: GestureDetector(
                  onTap: _previousPage,
                  child: Container(
                    width: 20.w,
                    height: 20.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color:AppColors.darkSurface,
                      size: 18.sp,
                    ),
                  ),
                ),
              ),
            Positioned(
              bottom: 74.h,
              right: 24.w,
              child: OnboardingProgressArrow(
                currentIndex: _currentIndex,
                totalPages: pages.length,
                onNext: _nextPage,
              ),
            ),
            Positioned(
              bottom: 217.h,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: pages.length,
                  effect: ExpandingDotsEffect(
                    dotHeight: 8.h,
                    dotWidth: 8.h,
                    expansionFactor: 3,
                    spacing: 4.w,
                    activeDotColor: AppColors.onPrimary,
                    dotColor: AppColors.onSecondary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/core/utils/app_images.dart';
import 'package:rafiq_app/features/onBoarding/presentation/widgets/onboarding_page.dart';
import 'package:rafiq_app/features/onBoarding/presentation/widgets/onboarding_page_view.dart';
import 'package:rafiq_app/features/onBoarding/presentation/widgets/onboarding_navigation_controls.dart';
import 'package:rafiq_app/features/onBoarding/presentation/widgets/onboarding_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      OnboardingPage(
        imagePath: AppImages.sleepingBoy,
        title: "Understand your baby's cry",
        description:
            "Detect the reason behind each cry using AI-powered insights to help you respond with confidence.",
      ),
      OnboardingPage(
        imagePath: AppImages.mother1,
        title: "Take Care of Your Mental Health",
        description:
            "Track your mood and detect early signs of postpartum depression for better self-awareness.",
      ),
      OnboardingPage(
        imagePath: AppImages.motherAndBaby,
        title: "Find the safest delivery option",
        description:
            "Discover the safest delivery type for you, and get personalized tips for a secure, comfortable experience.",
      ),
    ];
  }

  void _nextPage() {
    if (_currentIndex < pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.go(AppRoutes.signInScreen);
    }
  }

  void _previousPage() {
    if (_currentIndex > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.onSecondary, AppColors.lightBackground],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            // PageView
            OnboardingPageView(
              controller: _controller,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              pages: pages,
            ),

            // Navigation controls (Skip, Back, Next)
            OnboardingNavigationControls(
              currentIndex: _currentIndex,
              totalPages: pages.length,
              onNext: _nextPage,
              onPrevious: _previousPage,
              onSkip: () => context.go(AppRoutes.signInScreen),
            ),

            // Page indicator
            OnboardingIndicator(
              controller: _controller,
              count: pages.length,
            ),
          ],
        ),
      ),
    );
  }
}