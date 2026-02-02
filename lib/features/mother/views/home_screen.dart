import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/features/mother/widgets/widgets/home_header_widget.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../core/routing/app_routes.dart';
import '../widgets/widgets/Custom_weeks_scroller.dart';
import '../widgets/widgets/baby_progress_widget.dart';
import '../widgets/widgets/custom_gridview_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.lightSurface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.ph,
              HomeHeader(),
              20.ph,
              Text("Pregnancy\nJourney", style: AppTextStyles.font22Medium),
              20.ph,
              CustomWeeksScroller(),
              25.ph,
              BabyProgress(),
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
    );
  }
}
