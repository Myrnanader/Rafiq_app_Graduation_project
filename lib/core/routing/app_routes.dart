class AppRoutes {
  // -------- Auth & Onboarding --------
  static const String splashScreen = '/splashScreen';
  static const String onBoardScreen = '/OnboardingScreen';
  static const String signInScreen = '/SignInScreen';
  static const String signUpScreen = '/SignUpScreen';
  static const String forgetPasswordScreen = '/ForgetPasswordScreen';
  static const String createNewPasswordScreen = '/CreateNewPasswordScreen';
  static const String passwordChangedScreen = '/PasswordChangedScreen';
  static const String verifyOtpScreen = '/VerifyOtpScreen';
  static const String selectRoleScreen = '/SelectRoleScreen';
  static const String chooseParentTypeScreen = '/ChooseParentTypeScreen';
  static const String motherInformationScreen = '/MotherInformationScreen';
  static const String doctorInformationScreen = '/DoctorInformationScreen';
  static const String accountCreatedSuccessfullyScreen ='/AccountCreatedSuccessfullyScreen';

  // -------- Main Navigation --------
  static const String mainNavigationBarScreen = '/MainNavigationScreen';
  static const String dashboardScreen = '/DashboardScreen';
  static const String homeScreen = '/HomeScreen';

  // -------- Hospital Feature --------
  static const String hospitalLiveDoctorScreen = '/HospitalLiveDoctorScreen';
  static const String nearbyHospitalScreen = '/NearbyHospitalScreen';

  // -------- Community Feature --------
  static const String communityScreen = '/CommunityScreen';
  static const String experienceScreen = '/ExperienceScreen';
  static const String addExperienceScreen = '/AddExperienceScreen';
  static const String addPostScreen = '/AddPostScreen';

  // -------- Profile & Memories --------
  static const String profileScreen = '/ProfileScreen';
  static const String editProfileScreen = '/EditProfileScreen';
  static const String addMemoryScreen = '/AddMemoryScreen';
  static const String memoriesScreen = '/MemoriesScreen';
  static const String seeMemoriesScreen = '/SeeMemoriesScreen';
  static const String docsScreen = '/DocsScreen';
  static const String seeDocsScreen = '/SeeDocsScreen';
  static const String addDocScreen = '/AddDocScreen';

  // -------- Baby / Family --------
  static const String babyProfileScreen = '/BabyProfileScreen';
  static const String addFatherIdScreen = '/AddFatherIdScreen';

  // -------- Vaccinations Feature --------
 
  /// Parent
  static const String vaccinationsScreen = '/vaccinations';

  /// Child NAMES (لـ pushNamed)
  static const String vaccineScheduleName = 'vaccineSchedule';
  static const String vaccineDetailsName = 'vaccineDetails';

  /// Other
  static const String selectVaccinationChildScreen = '/select-child';

  // -------- Settings --------
  static const String settingScreen = '/SettingScreen';
  static const String notificationScreen = '/NotificationScreen';
  static const String notificationDetailsScreen = '/NotificationDetailsScreen';
  static const String changePasswordScreen = '/ChangePasswordScreen';

  // -------- Content (Exercise / Articles / Videos / Food) --------
  static const String exerciseScreen = '/ExerciseScreen';
  static const String articleScreen = '/ArticleScreen';
  static const String videoScreen = '/VideoScreen';
  static const String foodScreen = '/FoodScreen';

  // -------- Cry Feature --------
  static const String cryAnalysisScreen = '/CryAnalysisScreen';
  static const String cryProgressScreen = '/CryProgressScreen';
  static const String cryResultScreen = '/CryResultScreen';

  // -------- Depression Feature --------
  static const String depressionStartScreen = '/DepressionStartScreen';
  static const String depressionSurveyScreen = '/DepressionSurveyScreen';
  static const String depressionResultScreen = '/DepressionResultScreen';

  // -------- Delivery Feature --------
  static const String deliveryStartScreen = '/deliveryStart';
  static const String deliverySurveyScreen = '/deliverySurvey';
  static const String deliveryResultScreen = '/deliveryResult';

  // -------- ChatBot --------
  static const String chatAiScreen = '/ChatAiScreen';
  static const String chatbotScreen = '/ChatbotScreen';

  // -------- Growth Feature --------
  static const String selectChildScreen = "/selectChild";
  static const String growthTrackerScreen = '/GrowthTrackerScreen';
  static const String addGrowthScreen = '/AddGrowthScreen';
  static const String growthSuccessScreen = '/GrowthSuccessScreen';
}