import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/features/mother/widgets/widgets/custom_gridview_widget.dart';
import '../../../../core/helpers/extensions.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightSurface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Mother's Dashboard",
                style: AppTextStyles.font20SemiBold,
                textAlign: TextAlign.center,
              ),
              80.ph,
              CustomGridviewWidget(
                items: [
                  {
                    "icon": "assets/icons/Baby_crying.svg",
                    "label": "Cry Analysis",
                  },
                  {
                    "icon": "assets/icons/stress.svg",
                    "label": "Postpartum\nDepression",
                  },
                  {
                    "icon": "assets/icons/pregnant_vector.svg",
                    "label": "Delivery",
                  },
                  {
                    "icon": "assets/icons/growth.svg",
                    "label": "Growth Tracker",
                  },
                  {
                    "icon": "assets/icons/vaccinations.svg",
                    "label": "Vaccinations",
                    "route": AppRoutes.vaccinationsScreen,
                  },
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
