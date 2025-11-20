import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
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
        builder: (context, state) => const OnBoardingScreen(),
      ),
      /*
      GoRoute(
        path: AppRoutes.loginScreen,
        name: AppRoutes.loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.registerScreen,
        name: AppRoutes.registerScreen,
        builder: (context, state) => const RegisterScreen(),
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
        builder: (context, state) =>const PasswordChangedScreen(),
      ),

      GoRoute(
        path: AppRoutes.verifyOtpScreen,
        name: AppRoutes.verifyOtpScreen,
        builder: (context, state) => const VerifyOtpScreen(),
      ),

      GoRoute(
        path: AppRoutes.mainScreen,
        name: AppRoutes.mainScreen,
        builder: (context, state) => const MainScreen(),
      ),

      GoRoute(
        path: AppRoutes.profileScreen,
        name: AppRoutes.profileScreen,
        builder: (context, state) => const ProfileScreen(),
      ),
        
      */
      ],
    );
  }
}