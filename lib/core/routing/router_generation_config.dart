import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
<<<<<<< HEAD
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
import '../../features/articles/views/article_screen.dart';
import '../../features/auth/presentation/views/account_created_screen.dart';
import '../../features/auth/presentation/views/choose_parent_type_screen.dart';
import '../../features/auth/presentation/views/create_new_password_screen.dart';
import '../../features/auth/presentation/views/doctor_information.dart';
import '../../features/auth/presentation/views/forget_password_screen.dart';
import '../../features/auth/presentation/views/mother_information.dart';
import '../../features/auth/presentation/views/password_changed_screen.dart';
import '../../features/auth/presentation/views/select_role_screen.dart';
import '../../features/auth/presentation/views/sign_in_screen.dart';
import '../../features/auth/presentation/views/sign_up_screen.dart';
import '../../features/auth/presentation/views/verify_otp_screen.dart';
import '../../features/cry/presentation/views/cry_analysis_screen.dart';
import '../../features/cry/presentation/views/cry_progress_screen.dart';
import '../../features/cry/presentation/views/cry_results_screen.dart';
import '../../features/dailyExercise/views/exercise_screen.dart';
import '../../features/delivery/presentation/view/delivery_result_screen.dart';
import '../../features/delivery/presentation/view/delivery_start_screen.dart';
import '../../features/delivery/presentation/view/delivery_survey_screen.dart';
import '../../features/depression/presentation/views/depression_result_screen.dart';
import '../../features/depression/presentation/views/depression_start_screen.dart';
import '../../features/depression/presentation/views/depression_survey_screen.dart';
import '../../features/findaDoctorNow/views/hospital_live_doctor_screen.dart';
import '../../features/findaDoctorNow/views/nearby_hospital_screen.dart';
import '../../features/foods/views/food_screen.dart';
import '../../features/mother/views/add_experience_screen.dart';
import '../../features/mother/views/add_father_id_screen.dart';
import '../../features/mother/views/add_post_screen.dart';
import '../../features/mother/views/baby_profile_screen.dart';
import '../../features/mother/views/community_screen.dart';
import '../../features/mother/views/experience_screen.dart';
import '../../features/mother/views/home_screen.dart';
import '../../features/mother/views/main_navigation_screen.dart';
import '../../features/mother/views/profile_screen.dart';
import '../../features/motherSettings/views/change_password_screen.dart';
import '../../features/motherSettings/views/edit_profile_screen.dart';
import '../../features/motherSettings/views/setting_screen.dart';
import '../../features/notification/views/notification_details_screen.dart';
import '../../features/notification/views/notification_screen.dart';
import '../../features/vaccinations/views/vaccinations_screen.dart';
import '../../features/videos/views/video_screen.dart';
=======
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
import 'package:rafiq_app/features/doctors/nearby_hospital_screen.dart';
import 'package:rafiq_app/features/growth/presentation/views/add_growth_record_screen.dart';
import 'package:rafiq_app/features/growth/presentation/views/growth_success_screen.dart';
import 'package:rafiq_app/features/growth/presentation/views/growth_tracker_screen.dart';
import 'package:rafiq_app/features/onBoarding/presentation/screens/on_boarding_screen.dart';
import 'package:rafiq_app/features/splash/presentation/screens/splash_screen.dart';
>>>>>>> origin/development

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
<<<<<<< HEAD

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
          path: AppRoutes.hospitalLiveDoctorScreen,
          name: AppRoutes.hospitalLiveDoctorScreen,
          builder: (context, state) => const HospitalLiveDoctorScreen(),
        ),

        GoRoute(
          path: AppRoutes.nearbyHospitalScreen,
          name: AppRoutes.nearbyHospitalScreen,
          builder: (context, state) => NearbyHospitalScreen(),
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
          path: AppRoutes.addExperienceScreen,
          name: AppRoutes.addExperienceScreen,
          builder: (context, state) => AddExperienceScreen(),
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
          path: AppRoutes.addFatherIdScreen,
          name: AppRoutes.addFatherIdScreen,
          builder: (context, state) =>  AddFatherIdScreen(),
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


=======
>>>>>>> origin/development
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
<<<<<<< HEAD

=======
>>>>>>> origin/development
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

<<<<<<< HEAD
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
=======
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

        GoRoute(
          path: AppRoutes.nearbyHospitalScreen,
          name: AppRoutes.nearbyHospitalScreen,
          builder: (context, state) => NearbyHospitalScreen(),
        ),
>>>>>>> origin/development
      ],
    );
  }
}
