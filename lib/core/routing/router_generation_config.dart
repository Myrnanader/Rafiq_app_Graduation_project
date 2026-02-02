import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/features/mother/views/dashboard_screen.dart';
import 'package:rafiq_app/features/onBoarding/presentation/screens/on_boarding_screen.dart';
import 'package:rafiq_app/features/splash/presentation/screens/splash_screen.dart';
import '../../features/addMemoryAndDocs/views/add_docs_screen.dart';
import '../../features/addMemoryAndDocs/views/add_memory_screen.dart';
import '../../features/addMemoryAndDocs/views/docs_screen.dart';
import '../../features/addMemoryAndDocs/views/memories_screen.dart';
import '../../features/addMemoryAndDocs/views/see_docs_screen.dart';
import '../../features/addMemoryAndDocs/views/see_memories_screen.dart';
import '../../features/addMemoryAndDocs/widgets/widgets/doc_item.dart';
import '../../features/addMemoryAndDocs/widgets/widgets/memory_item.dart';
import '../../features/mother/views/add_post_screen.dart';
import '../../features/mother/views/article_screen.dart';
import '../../features/mother/views/baby_profile_screen.dart';
import '../../features/mother/views/change_password_screen.dart';
import '../../features/mother/views/community_screen.dart';
import '../../features/mother/views/edit_profile_screen.dart';
import '../../features/mother/views/exercise_screen.dart';
import '../../features/mother/views/experience_screen.dart';
import '../../features/mother/views/food_screen.dart';
import '../../features/mother/views/home_screen.dart';
import '../../features/mother/views/main_navigation_screen.dart';
import '../../features/mother/views/profile_screen.dart';
import '../../features/mother/views/setting_screen.dart';
import '../../features/mother/views/vaccinations_screen.dart';
import '../../features/mother/views/video_screen.dart';
import '../../features/notification/views/notification_details_screen.dart';
import '../../features/notification/views/notification_screen.dart';

abstract class RouterGenerationConfig {
  static late final GoRouter router;

  static void initRouter() {
    router = GoRouter(
      initialLocation: AppRoutes.splashScreen, // Splash
      routes: [
        GoRoute(
          path: AppRoutes.splashScreen,
          builder: (context, state) => SplashScreen(),
        ),

        GoRoute(
          path: AppRoutes.onBoardScreen,
          name: AppRoutes.onBoardScreen,
          builder: (context, state) => const OnBoardingScreen(),
        ),

        GoRoute(
          path: AppRoutes.mainNavigationBarScreen,
          name: AppRoutes.mainNavigationBarScreen,
          builder: (context, state) => const MainNavigationScreen(),
        ),

        GoRoute(
          path: AppRoutes.homeScreen,
          name: AppRoutes.homeScreen,
          builder: (context, state) => const HomeScreen(),
        ),

        GoRoute(
          path: AppRoutes.dashboardScreen,
          name: AppRoutes.dashboardScreen,
          builder: (context, state) => const DashboardScreen(),
        ),

        GoRoute(
          path: AppRoutes.vaccinationsScreen,
          name: AppRoutes.vaccinationsScreen,
          builder: (context, state) => const VaccinationsScreen(),
        ),

        GoRoute(
          path: AppRoutes.communityScreen,
          name: AppRoutes.communityScreen,
          builder: (context, state) => const CommunityScreen(),
        ),

        GoRoute(
          path: AppRoutes.experienceScreen,
          name: AppRoutes.experienceScreen,
          builder: (context, state) => const ExperienceScreen(userName: '', date: '', description: '', userImage: '',),
        ),

        GoRoute(
          path: AppRoutes.addPostScreen,
          name: AppRoutes.addPostScreen,
          builder: (context, state) =>  AddPostScreen(),
        ),

        GoRoute(
          path: AppRoutes.profileScreen,
          name: AppRoutes.profileScreen,
          builder: (context, state) =>  ProfileScreen(),
        ),

        GoRoute(
          path: AppRoutes.addMemoryScreen,
          name: AppRoutes.addMemoryScreen,
          builder: (context, state) =>  AddMemoryScreen(),
        ),

        GoRoute(
          path: AppRoutes.memoriesScreen,
          name: AppRoutes.memoriesScreen,
          builder: (context, state) =>  MemoriesScreen(),
        ),

        GoRoute(
          path: AppRoutes.docsScreen,
          name: AppRoutes.docsScreen,
          builder: (context, state) =>  DocsScreen(),
        ),

        GoRoute(
          path: AppRoutes.seeMemoriesScreen,
          name: AppRoutes.seeMemoriesScreen,
          builder: (context, state) {
            final memory = state.extra as MemoryItem;
            return SeeMemoriesScreen(memory: memory);
          },
        ),

        GoRoute(
          path: AppRoutes.seeDocsScreen,
          name: AppRoutes.seeDocsScreen,
          builder: (context, state) {
            final doc = state.extra as DocItem;
            return SeeDocsScreen(doc: doc);
          },
        ),

        GoRoute(
          path: AppRoutes.addDocScreen,
          name: AppRoutes.addDocScreen,
          builder: (context, state) =>  AddDocScreen(),
        ),

        GoRoute(
          path: AppRoutes.babyProfileScreen,
          name: AppRoutes.babyProfileScreen,
          builder: (context, state) =>  BabyProfileScreen(),
        ),

        GoRoute(
          path: AppRoutes.settingScreen,
          name: AppRoutes.settingScreen,
          builder: (context, state) =>  SettingScreen(),
        ),

        GoRoute(
          path: AppRoutes.notificationScreen,
          name: AppRoutes.notificationScreen,
          builder: (context, state) =>  NotificationScreen(),
        ),
        GoRoute(
          path: AppRoutes.notificationDetailsScreen,
          name: AppRoutes.notificationDetailsScreen,
          builder: (context, state) =>  NotificationDetailsScreen(),
        ),

        GoRoute(
          path: AppRoutes.editProfileScreen,
          name: AppRoutes.editProfileScreen,
          builder: (context, state) =>  EditProfileScreen(),
        ),

        GoRoute(
          path: AppRoutes.changePasswordScreen,
          name: AppRoutes.changePasswordScreen,
          builder: (context, state) =>  ChangePasswordScreen(),
        ),

        GoRoute(
          path: AppRoutes.exerciseScreen,
          name: AppRoutes.exerciseScreen,
          builder: (context, state) =>  ExerciseScreen(),
        ),

        GoRoute(
          path: AppRoutes.articleScreen,
          name: AppRoutes.articleScreen,
          builder: (context, state) =>  ArticleScreen(),
        ),

        GoRoute(
          path: AppRoutes.videoScreen,
          name: AppRoutes.videoScreen,
          builder: (context, state) =>  VideoScreen(),
        ),

        GoRoute(
          path: AppRoutes.foodScreen,
          name: AppRoutes.foodScreen,
          builder: (context, state) =>  FoodScreen(),
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
        path: AppRoutes.profileScreen,
        name: AppRoutes.profileScreen,
        builder: (context, state) => const ProfileScreen(),
      ),

      */
      ],
    );
  }
}
