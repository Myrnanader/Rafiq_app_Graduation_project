import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq_app/core/di/di.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/features/auth/presentation/cubit/user_cubit.dart';
import 'package:rafiq_app/features/mother/presentation/widgets/widgets/custom_weeks_scroller.dart';
import 'package:rafiq_app/features/mother/presentation/widgets/widgets/home_header_widget.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../core/routing/app_routes.dart';
import '../widgets/widgets/baby_progress_widget.dart';
import '../widgets/widgets/custom_gridview_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserCubit>()..getProfile(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.ph,

                //  بيجيب fullName من SharedPrefs تلقائياً
                const HomeHeader(),

                20.ph,

                Text("Pregnancy\nJourney", style: AppTextStyles.font22Medium),

                20.ph,

                //  بيبدأ من الـ pregnancyWeek المحفوظة
                CustomWeeksScroller(),

                25.ph,

                //  بيحسب الـ progress من الـ week المحفوظة
                const BabyProgress(),

                30.ph,

                Text("Daily Routine", style: AppTextStyles.font22Medium),

                20.ph,

                CustomGridviewWidget(
                  items: [
                    {
                      "route": AppRoutes.exerciseScreen,
                      "icon": 'assets/icons/pergancy_woman_vector.svg',
                      "label": "Daily Exercise",
                    },
                    {
                      "route": AppRoutes.articleScreen,
                      "icon": "assets/icons/Group.svg",
                      "label": "Articles",
                    },
                    {
                      "route": AppRoutes.videoScreen,
                      "icon": "assets/icons/video.svg",
                      "label": "Videos",
                    },
                    {
                      "route": AppRoutes.foodScreen,
                      "icon": "assets/icons/food.svg",
                      "label": "Food",
                    },
                  ],
                ),

                40.ph,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
