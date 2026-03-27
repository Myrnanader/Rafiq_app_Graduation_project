import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/di/di.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';

// ================= CORE =================
import 'package:rafiq_app/features/splash/presentation/screens/splash_screen.dart';
import 'package:rafiq_app/features/onBoarding/presentation/screens/on_boarding_screen.dart';

// ================= AUTH =================
import 'package:rafiq_app/features/auth/presentation/views/account_created_screen.dart';
import 'package:rafiq_app/features/auth/presentation/views/create_new_password_screen.dart';
import 'package:rafiq_app/features/auth/presentation/views/forget_password_screen.dart';
import 'package:rafiq_app/features/auth/presentation/views/mother_information.dart';
import 'package:rafiq_app/features/auth/presentation/views/password_changed_screen.dart';
import 'package:rafiq_app/features/auth/presentation/views/select_role_screen.dart';
import 'package:rafiq_app/features/auth/presentation/views/sign_in_screen.dart';
import 'package:rafiq_app/features/auth/presentation/views/sign_up_screen.dart';
import 'package:rafiq_app/features/auth/presentation/views/verify_otp_screen.dart';

// ================= MOTHER =================
import 'package:rafiq_app/features/mother/views/dashboard_screen.dart';
import 'package:rafiq_app/features/mother/views/home_screen.dart';
import 'package:rafiq_app/features/mother/views/main_navigation_screen.dart';
import 'package:rafiq_app/features/mother/views/profile_screen.dart';

// ================= SETTINGS =================
import 'package:rafiq_app/features/motherSettings/views/change_password_screen.dart';
import 'package:rafiq_app/features/motherSettings/views/edit_profile_screen.dart';
import 'package:rafiq_app/features/motherSettings/views/setting_screen.dart';

// ================= MEMORY & DOCS =================
import '../../features/addMemoryAndDocs/views/add_docs_screen.dart';
import '../../features/addMemoryAndDocs/views/add_memory_screen.dart';
import '../../features/addMemoryAndDocs/views/docs_screen.dart';
import '../../features/addMemoryAndDocs/views/memories_screen.dart';
import '../../features/addMemoryAndDocs/views/see_docs_screen.dart';
import '../../features/addMemoryAndDocs/views/see_memories_screen.dart';
import '../../features/addMemoryAndDocs/widgets/widgets/doc_item.dart';
import '../../features/addMemoryAndDocs/widgets/widgets/memory_item.dart';

// ================= ARTICLES / MEDIA =================
import '../../features/articles/views/article_screen.dart';
import '../../features/videos/views/video_screen.dart';
import '../../features/foods/views/food_screen.dart';

// ================= CHAT =================
import '../../features/chat/screens/chat_ai_screen.dart';
import '../../features/chat/screens/chatbot_screen.dart';

// ================= NOTIFICATIONS =================

// ================= MEDICAL =================

// ================= EXERCISE =================
import '../../features/dailyExercise/views/exercise_screen.dart';

// ================= DELIVERY =================
import '../../features/delivery/presentation/view/delivery_start_screen.dart';
import '../../features/delivery/presentation/view/delivery_survey_screen.dart';
import '../../features/delivery/presentation/view/delivery_result_screen.dart';

// ================= DEPRESSION =================
import '../../features/depression/presentation/views/depression_start_screen.dart';
import '../../features/depression/presentation/views/depression_survey_screen.dart';
import '../../features/depression/presentation/views/depression_result_screen.dart';

// ================= GROWTH =================
import '../../features/growth/presentation/views/add_growth_record_screen.dart';
import '../../features/growth/presentation/views/growth_success_screen.dart';
import '../../features/growth/presentation/views/growth_tracker_screen.dart';

// ================= CRY =================
import 'package:rafiq_app/features/cry/data/repository/cry_repository.dart';
import 'package:rafiq_app/features/cry/presentation/cubit/cry_cubit.dart';
import 'package:rafiq_app/features/cry/presentation/views/cry_analysis_screen.dart';
import 'package:rafiq_app/features/cry/presentation/views/cry_progress_screen.dart';
import 'package:rafiq_app/features/cry/presentation/views/cry_results_screen.dart';

abstract class RouterGenerationConfig {
  static late final GoRouter router;

  static void initRouter() {
    router = GoRouter(
      initialLocation: AppRoutes.splashScreen,
      routes: [
        // ================= SPLASH =================
        GoRoute(
          path: AppRoutes.splashScreen,
          builder: (context, state) => const SplashScreen(),
        ),

        // ================= ONBOARD =================
        GoRoute(
          path: AppRoutes.onBoardScreen,
          builder: (context, state) => const OnboardingScreen(),
        ),

        // ================= AUTH =================
        GoRoute(
          path: AppRoutes.signInScreen,
          builder: (context, state) => const SignInScreen(),
        ),
        GoRoute(
          path: AppRoutes.signUpScreen,
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          path: AppRoutes.forgetPasswordScreen,
          builder: (context, state) => const ForgetPasswordScreen(),
        ),
        GoRoute(
          path: AppRoutes.createNewPasswordScreen,
          builder: (context, state) => const CreateNewPasswordScreen(),
        ),
        GoRoute(
          path: AppRoutes.passwordChangedScreen,
          builder: (context, state) => const PasswordSuccessScreen(),
        ),
        GoRoute(
          path: AppRoutes.verifyOtpScreen,
          builder: (context, state) => const VerifyOtpScreen(),
        ),
        GoRoute(
          path: AppRoutes.selectRoleScreen,
          builder: (context, state) => const SelectRoleScreen(),
        ),
        GoRoute(
          path: AppRoutes.motherInformationScreen,
          builder: (context, state) => const MotherInformationScreen(),
        ),
        GoRoute(
          path: AppRoutes.accountCreatedSuccessfullyScreen,
          builder: (context, state) =>
              const AccountCreatedSuccessfullyScreen(),
        ),

        // ================= MAIN =================
        GoRoute(
          path: AppRoutes.mainNavigationBarScreen,
          builder: (context, state) => const MainNavigationScreen(),
        ),
        GoRoute(
          path: AppRoutes.homeScreen,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: AppRoutes.dashboardScreen,
          builder: (context, state) => const DashboardScreen(),
        ),

        // ================= MEMORY & DOCS =================
        GoRoute(
          path: AppRoutes.addMemoryScreen,
          builder: (context, state) => AddMemoryScreen(),
        ),
        GoRoute(
          path: AppRoutes.memoriesScreen,
          builder: (context, state) => MemoriesScreen(),
        ),
        GoRoute(
          path: AppRoutes.docsScreen,
          builder: (context, state) => DocsScreen(),
        ),
        GoRoute(
          path: AppRoutes.seeMemoriesScreen,
          builder: (context, state) {
            final memory = state.extra as MemoryItem;
            return SeeMemoriesScreen(memory: memory);
          },
        ),
        GoRoute(
          path: AppRoutes.seeDocsScreen,
          builder: (context, state) {
            final doc = state.extra as DocItem;
            return SeeDocsScreen(doc: doc);
          },
        ),
        GoRoute(
          path: AppRoutes.addDocScreen,
          builder: (context, state) => AddDocScreen(),
        ),

        // ================= PROFILE =================
        GoRoute(
          path: AppRoutes.profileScreen,
          builder: (context, state) => ProfileScreen(),
        ),

        // ================= SETTINGS =================
        GoRoute(
          path: AppRoutes.settingScreen,
          builder: (context, state) => SettingScreen(),
        ),
        GoRoute(
          path: AppRoutes.editProfileScreen,
          builder: (context, state) => EditProfileScreen(),
        ),
        GoRoute(
          path: AppRoutes.changePasswordScreen,
          builder: (context, state) => ChangePasswordScreen(),
        ),

        // ================= MEDIA =================
        GoRoute(
          path: AppRoutes.articleScreen,
          builder: (context, state) => ArticleScreen(),
        ),
        GoRoute(
          path: AppRoutes.videoScreen,
          builder: (context, state) => VideoScreen(),
        ),
        GoRoute(
          path: AppRoutes.foodScreen,
          builder: (context, state) => FoodScreen(),
        ),

        // ================= EXERCISE =================
        GoRoute(
          path: AppRoutes.exerciseScreen,
          builder: (context, state) => ExerciseScreen(),
        ),

        // ================= CHAT =================
        GoRoute(
          path: AppRoutes.chatAiScreen,
          builder: (context, state) => const ChatAiScreen(),
        ),
        GoRoute(
          path: AppRoutes.chatbotScreen,
          builder: (context, state) {
            final message = state.extra as String?;
            return ChatbotScreen(initialMessage: message);
          },
        ),

        // ================= CRY FEATURE =================
        ShellRoute(
          builder: (context, state, child) {
            return BlocProvider(
              create: (_) => CryCubit(getIt<CryRepository>()),
              child: child,
            );
          },
          routes: [
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
          ],
        ),

        // ================= DEPRESSION =================
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

        // ================= DELIVERY =================
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

        // ================= GROWTH =================
        GoRoute(
          path: AppRoutes.growthTrackerScreen,
          builder: (context, state) => const GrowthTrackerScreen(),
        ),
        GoRoute(
          path: AppRoutes.addGrowthScreen,
          builder: (context, state) => const AddGrowthRecordScreen(),
        ),
        GoRoute(
          path: AppRoutes.growthSuccessScreen,
          builder: (context, state) => const GrowthSuccessScreen(),
        ),
      ],
    );
  }
}