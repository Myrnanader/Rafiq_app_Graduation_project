import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/features/auth/create_new_password/presentation/views/create_new_password_screen.dart';
import 'package:rafiq_app/features/auth/success/account_created_screen.dart';
import 'package:rafiq_app/features/auth/success/password_changed_screen.dart';
import 'package:rafiq_app/features/auth/forget_password/presentation/views/forget_password_screen.dart';
import 'package:rafiq_app/features/auth/information/presentation/views/doctor_information.dart';
import 'package:rafiq_app/features/auth/information/presentation/views/mother_information.dart';
import 'package:rafiq_app/features/auth/roles/presentation/views/choose_parent_type_screen.dart';
import 'package:rafiq_app/features/auth/roles/presentation/views/select_role_screen.dart';
import 'package:rafiq_app/features/auth/sign_in/presentation/views/sign_in_screen.dart';
import 'package:rafiq_app/features/auth/sign_up/presentation/views/sign_up_screen.dart';
import 'package:rafiq_app/features/auth/verify_otp/presentation/views/verify_otp_screen.dart';
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
        builder: (context, state) =>const PasswordSuccessScreen(),
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
      ],
    );
  }
}