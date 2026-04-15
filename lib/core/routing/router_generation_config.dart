import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/di/di.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/features/depression/presentation/cubit/postpartum_survey_cubit.dart';
import 'package:rafiq_app/features/growth/data/models/child_response.dart';
import 'package:rafiq_app/features/growth/presentation/views/select_child_screen.dart';
import 'package:rafiq_app/features/mother/presentation/cubit/mother_profile_cubit.dart';
import 'package:rafiq_app/features/mother/presentation/views/dashboard_screen.dart';
import 'package:rafiq_app/features/onBoarding/presentation/screens/on_boarding_screen.dart';
import 'package:rafiq_app/features/splash/presentation/screens/splash_screen.dart';
import 'package:rafiq_app/features/vaccinations/presentation/cubit/vaccinations_cubit.dart';
import 'package:rafiq_app/features/vaccinations/presentation/views/select_vaccination_child_screen.dart';
import 'package:rafiq_app/features/vaccinations/presentation/views/vaccinations_screen.dart';
import 'package:rafiq_app/features/vaccinations/presentation/views/vaccine_details_screen.dart';
import 'package:rafiq_app/features/vaccinations/presentation/views/vaccine_schedule_screen.dart';
import 'package:rafiq_app/features/vaccinations/presentation/widgets/vaccine_item.dart';
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
import '../../features/auth/presentation/views/create_new_password_screen.dart';
import '../../features/auth/presentation/views/forget_password_screen.dart';
import '../../features/auth/presentation/views/mother_information.dart';
import '../../features/auth/presentation/views/password_changed_screen.dart';
import '../../features/auth/presentation/views/select_role_screen.dart';
import '../../features/auth/presentation/views/sign_in_screen.dart';
import '../../features/auth/presentation/views/sign_up_screen.dart';
import '../../features/auth/presentation/views/verify_otp_screen.dart';
import '../../features/chat/screens/chat_ai_screen.dart';
import '../../features/chat/screens/chatbot_screen.dart';
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
import '../../features/growth/presentation/views/add_growth_record_screen.dart';
import '../../features/growth/presentation/views/growth_success_screen.dart';
import '../../features/growth/presentation/views/growth_tracker_screen.dart';
import '../../features/mother/presentation/views/add_experience_screen.dart';
import '../../features/mother/presentation/views/add_father_id_screen.dart';
import '../../features/mother/presentation/views/add_post_screen.dart';
import '../../features/mother/presentation/views/baby_profile_screen.dart';
import '../../features/mother/presentation/views/community_screen.dart';
import '../../features/mother/presentation/views/experience_screen.dart';
import '../../features/mother/presentation/views/home_screen.dart';
import '../../features/mother/presentation/views/main_navigation_screen.dart';
import '../../features/mother/presentation/views/profile_screen.dart';
import '../../features/motherSettings/presentation/views/change_password_screen.dart';
import '../../features/motherSettings/presentation/views/edit_profile_screen.dart';
import '../../features/notification/views/notification_details_screen.dart';
import '../../features/notification/views/notification_screen.dart';
import '../../features/videos/views/video_screen.dart';

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
          path: AppRoutes.motherInformationScreen,
          name: AppRoutes.motherInformationScreen,
          builder: (context, state) => const MotherInformationScreen(),
        ),

        GoRoute(
          path: AppRoutes.accountCreatedSuccessfullyScreen,
          name: AppRoutes.accountCreatedSuccessfullyScreen,
          builder: (context, state) => const AccountCreatedSuccessfullyScreen(),
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
          path: AppRoutes.hospitalLiveDoctorScreen,
          name: AppRoutes.hospitalLiveDoctorScreen,
          builder: (context, state) => const HospitalLiveDoctorScreen(),
        ),

        GoRoute(
          path: AppRoutes.nearbyHospitalScreen,
          name: AppRoutes.nearbyHospitalScreen,
          builder: (context, state) => NearbyHospitalScreen(),
        ),

       /// ================= Vaccinations =================

GoRoute(
  path: AppRoutes.selectVaccinationChildScreen,
  name: AppRoutes.selectVaccinationChildScreen,
  builder: (context, state) =>
      const SelectVaccinationChildScreen(),
),

GoRoute(
  path: AppRoutes.vaccinationsScreen,
  name: AppRoutes.vaccinationsScreen, // ✅ ضيف name
  builder: (context, state) {
    final childId = state.extra as String;
    return VaccinationsScreen(childId: childId);
  },

  routes: [
    /// 🔵 Schedule
    GoRoute(
      path: 'schedule', // ✅ بدون /
      name: AppRoutes.vaccineScheduleName, // ✅ لازم name
      builder: (context, state) {
        final vaccineId = state.extra as String;
        return VaccineScheduleScreen(vaccineId: vaccineId);
      },
    ),

    /// 🔵 Details
    GoRoute(
      path: 'details', //  بدون /
      name: AppRoutes.vaccineDetailsName, // مهم جدًا
      builder: (context, state) {
        final vaccine = state.extra as VaccineItem;
        return VaccineDetailsScreen(vaccine: vaccine);
      },
    ),
  ],
),
//____________________________________
        GoRoute(
          path: AppRoutes.communityScreen,
          name: AppRoutes.communityScreen,
          builder: (context, state) => const CommunityScreen(),
        ),

        GoRoute(
          path: AppRoutes.experienceScreen,
          name: AppRoutes.experienceScreen,
          builder: (context, state) => const ExperienceScreen(
            userName: '',
            date: '',
            description: '',
            userImage: '',
          ),
        ),

        GoRoute(
          path: AppRoutes.addExperienceScreen,
          name: AppRoutes.addExperienceScreen,
          builder: (context, state) => AddExperienceScreen(),
        ),

        GoRoute(
          path: AppRoutes.addPostScreen,
          name: AppRoutes.addPostScreen,
          builder: (context, state) => AddPostScreen(),
        ),

        GoRoute(
          path: AppRoutes.profileScreen,
          name: AppRoutes.profileScreen,
          builder: (context, state) => ProfileScreen(),
        ),

        GoRoute(
          path: AppRoutes.addMemoryScreen,
          name: AppRoutes.addMemoryScreen,
          builder: (context, state) => AddMemoryScreen(),
        ),

        GoRoute(
          path: AppRoutes.memoriesScreen,
          name: AppRoutes.memoriesScreen,
          builder: (context, state) => MemoriesScreen(),
        ),

        GoRoute(
          path: AppRoutes.docsScreen,
          name: AppRoutes.docsScreen,
          builder: (context, state) => DocsScreen(),
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
          builder: (context, state) => AddDocScreen(),
        ),

        GoRoute(
          path: AppRoutes.babyProfileScreen,
          name: AppRoutes.babyProfileScreen,
          builder: (context, state) {
            final cubit = state.extra as MotherProfileCubit;

            return BlocProvider.value(
              value: cubit, //  نفس الـ instance
              child: const BabyProfileScreen(),
            );
          },
        ),

        GoRoute(
          path: AppRoutes.addFatherIdScreen,
          name: AppRoutes.addFatherIdScreen,
          builder: (context, state) {
            final cubit = state.extra as MotherProfileCubit;

            return BlocProvider.value(
              value: cubit,
              child: const AddFatherIdScreen(),
            );
          },
        ),

        GoRoute(
          path: AppRoutes.settingScreen,
          name: AppRoutes.settingScreen,
          builder: (context, state) => NotificationScreen(),
        ),

        GoRoute(
          path: AppRoutes.notificationScreen,
          name: AppRoutes.notificationScreen,
          builder: (context, state) => NotificationScreen(),
        ),
        GoRoute(
          path: AppRoutes.notificationDetailsScreen,
          name: AppRoutes.notificationDetailsScreen,
          builder: (context, state) => NotificationDetailsScreen(),
        ),

        GoRoute(
          path: AppRoutes.editProfileScreen,
          name: AppRoutes.editProfileScreen,
          builder: (context, state) => const EditProfileScreen(),
        ),

        GoRoute(
          path: AppRoutes.changePasswordScreen,
          name: AppRoutes.changePasswordScreen,
          builder: (context, state) => ChangePasswordScreen(),
        ),

        GoRoute(
          path: AppRoutes.exerciseScreen,
          name: AppRoutes.exerciseScreen,
          builder: (context, state) => ExerciseScreen(),
        ),

        GoRoute(
          path: AppRoutes.articleScreen,
          name: AppRoutes.articleScreen,
          builder: (context, state) => ArticleScreen(),
        ),

        GoRoute(
          path: AppRoutes.videoScreen,
          name: AppRoutes.videoScreen,
          builder: (context, state) => VideoScreen(),
        ),

        GoRoute(
          path: AppRoutes.foodScreen,
          name: AppRoutes.foodScreen,
          builder: (context, state) => FoodScreen(),
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
          builder: (context, state) => BlocProvider(
            create: (_) => getIt<PostpartumSurveyCubit>(),
            child: const DepressionSurveyScreen(),
          ),
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

        /// ChatBot
        GoRoute(
          path: AppRoutes.chatAiScreen,
          name: AppRoutes.chatAiScreen,
          builder: (context, state) => const ChatAiScreen(),
        ),
        GoRoute(
          path: AppRoutes.chatbotScreen,
          name: AppRoutes.chatbotScreen,
          builder: (context, state) {
            final message = state.extra as String?;
            return ChatbotScreen(initialMessage: message);
          },
        ),

        /// ================= Growth =================
        GoRoute(
          path: AppRoutes.selectChildScreen,
          builder: (context, state) => const SelectChildScreen(),
        ),

        GoRoute(
          path: AppRoutes.growthTrackerScreen,
          builder: (context, state) {
            ///  ممكن يبعتوا ChildResponse أو String (childId)
            final extra = state.extra;
            if (extra is ChildResponse) {
              return GrowthTrackerScreen(child: extra);
            }

            /// fallback لو بعت childId فقط → مش المفروض يحصل لكن للأمان
            return const SelectChildScreen();
          },
        ),

        GoRoute(
          path: AppRoutes.addGrowthScreen,
          builder: (context, state) {
            final childId = state.extra as String;
            return AddGrowthRecordScreen(childId: childId);
          },
        ),

        GoRoute(
          path: AppRoutes.growthSuccessScreen,
          builder: (context, state) {
            /// extra = childId (String) أو null
            return const GrowthSuccessScreen();
          },
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
