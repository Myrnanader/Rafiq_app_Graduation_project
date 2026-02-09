import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/features/auth/presentation/views/create_new_password_screen.dart';
import 'package:rafiq_app/features/auth/presentation/views/account_created_screen.dart';
import 'package:rafiq_app/features/auth/presentation/views/password_changed_screen.dart';
import 'package:rafiq_app/features/auth/presentation/views/forget_password_screen.dart';
import 'package:rafiq_app/features/auth/presentation/views/doctor_information.dart';
import 'package:rafiq_app/features/auth/presentation/views/mother_information.dart';
import 'package:rafiq_app/features/auth/presentation/views/choose_parent_type_screen.dart';
import 'package:rafiq_app/features/auth/presentation/views/select_role_screen.dart';
import 'package:rafiq_app/features/auth/presentation/views/sign_in_screen.dart';
import 'package:rafiq_app/features/auth/presentation/views/sign_up_screen.dart';
import 'package:rafiq_app/features/auth/presentation/views/verify_otp_screen.dart';
import 'package:rafiq_app/features/cry/presentation/views/cry_analysis_screen.dart';
import 'package:rafiq_app/features/cry/presentation/views/cry_progress_screen.dart';
import 'package:rafiq_app/features/cry/presentation/views/cry_results_screen.dart';
import 'package:rafiq_app/features/delivery/presentation/view/delivery_result_screen.dart';
import 'package:rafiq_app/features/delivery/presentation/view/delivery_start_screen.dart';
import 'package:rafiq_app/features/delivery/presentation/view/delivery_survey_screen.dart';
import 'package:rafiq_app/features/depression/presentation/views/depression_result_screen.dart';
import 'package:rafiq_app/features/depression/presentation/views/depression_start_screen.dart';
import 'package:rafiq_app/features/depression/presentation/views/depression_survey_screen.dart';
import 'package:rafiq_app/features/growth/presentation/views/add_growth_record_screen.dart';
import 'package:rafiq_app/features/growth/presentation/views/growth_success_screen.dart';
import 'package:rafiq_app/features/growth/presentation/views/growth_tracker_screen.dart';
import 'package:rafiq_app/features/onBoarding/presentation/screens/on_boarding_screen.dart';
import 'package:rafiq_app/features/splash/presentation/screens/splash_screen.dart';

abstract class RouterGenerationConfig {
  static late final GoRouter router;

  static void initRouter() {
    router = GoRouter(
      initialLocation: AppRoutes.splashScreen, // Splash
      routes: [
        GoRoute(
          path: AppRoutes.splashScreen,
          builder: (context, state) => SplashScreen(), //
        ),

        GoRoute(
          path: AppRoutes.onBoardScreen,
          name: AppRoutes.onBoardScreen,
          builder: (context, state) => const OnboardingScreen(),
        ),

        GoRoute(
          path: AppRoutes.signInScreen,
          name: AppRoutes.signInScreen,
          builder: (context, state) => const SignInScreen(),
        ),

        GoRoute(
          path: AppRoutes.signUpScreen,
          name: AppRoutes.signUpScreen,
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          path: AppRoutes.forgetPasswordScreen,
          name: AppRoutes.forgetPasswordScreen,
          builder: (context, state) => const ForgetPasswordScreen(),
        ),

        GoRoute(
          path: AppRoutes.createNewPasswordScreen,
          name: AppRoutes.createNewPasswordScreen,
          builder: (context, state) => const CreateNewPasswordScreen(),
        ),

        GoRoute(
          path: AppRoutes.passwordChangedScreen,
          name: AppRoutes.passwordChangedScreen,
          builder: (context, state) => const PasswordSuccessScreen(),
        ),

        GoRoute(
          path: AppRoutes.verifyOtpScreen,
          name: AppRoutes.verifyOtpScreen,
          builder: (context, state) => const VerifyOtpScreen(),
        ),

        GoRoute(
          path: AppRoutes.selectRoleScreen,
          name: AppRoutes.selectRoleScreen,
          builder: (context, state) => const SelectRoleScreen(),
        ),

        GoRoute(
          path: AppRoutes.chooseParentTypeScreen,
          name: AppRoutes.chooseParentTypeScreen,
          builder: (context, state) => const ChooseParentTypeScreen(),
        ),
        GoRoute(
          path: AppRoutes.motherInformationScreen,
          name: AppRoutes.motherInformationScreen,
          builder: (context, state) => const MotherInformationScreen(),
        ),
        GoRoute(
          path: AppRoutes.doctorInformationScreen,
          name: AppRoutes.doctorInformationScreen,
          builder: (context, state) => const DoctorInformationScreen(),
        ),
        GoRoute(
          path: AppRoutes.accountCreatedSuccessfullyScreen,
          name: AppRoutes.accountCreatedSuccessfullyScreen,
          builder: (context, state) => const AccountCreatedSuccessfullyScreen(),
        ),
        // ================= Cry Feature =================
        GoRoute(
          path: AppRoutes.cryAnalysisScreen,
          builder: (context, state) => const CryAnalysisScreen(),
        ),

        GoRoute(
          path: AppRoutes.cryProgressScreen,
          builder: (context, state) => const CryProgressScreen(),
        ),

        GoRoute(
          path: AppRoutes.cryResultScreen,
          builder: (context, state) => const CryResultScreen(),
        ),
        GoRoute(
          path: AppRoutes.depressionStartScreen,
          builder: (context, state) => const DepressionStartScreen(),
        ),

        GoRoute(
          path: AppRoutes.depressionSurveyScreen,
          builder: (context, state) => const DepressionSurveyScreen(),
        ),

        GoRoute(
          path: AppRoutes.depressionResultScreen,
          builder: (context, state) => const DepressionResultScreen(),
        ),
        GoRoute(
          path: AppRoutes.deliveryStartScreen,
          builder: (context, state) => const DeliveryStartScreen(),
        ),

        GoRoute(
          path: AppRoutes.deliverySurveyScreen,
          builder: (context, state) => const DeliverySurveyScreen(),
        ),

        GoRoute(
          path: AppRoutes.deliveryResultScreen,
          builder: (context, state) => const DeliveryResultScreen(),
        ),
        // ================= Growth Feature =================

GoRoute(
  path: AppRoutes.growthTrackerScreen,
  name: AppRoutes.growthTrackerScreen,
  builder: (context, state) => const GrowthTrackerScreen(),
),

GoRoute(
  path: AppRoutes.addGrowthScreen,
  name: AppRoutes.addGrowthScreen,
  builder: (context, state) => const AddGrowthRecordScreen(),
),

GoRoute(
  path: AppRoutes.growthSuccessScreen,
  name: AppRoutes.growthSuccessScreen,
  builder: (context, state) => const GrowthSuccessScreen(),
),
      ],
    );
  }
}
