import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';

import '../../../core/helpers/extensions.dart';
import '../../../core/theme/app_texts/app_text_styles.dart';
import '../../../core/theming/app_colors.dart';
import '../widgets/widgets/vaccine_card.dart';
import '../widgets/widgets/vaccine_tab_bar_widget.dart';
import '../widgets/widgets/vaccines_data.dart';

class VaccinationsScreen extends StatefulWidget {
  const VaccinationsScreen({super.key});

  @override
  State<VaccinationsScreen> createState() => _VaccinationsScreenState();
}

class _VaccinationsScreenState extends State<VaccinationsScreen> {
  int _selectedTabIndex = 0;

  final List<String> _tabs = [
    "Birth",
    "2 Months",
    "4 Months",
    "6 Months",
    "9 Months"
  ];

  List _getVaccinesForTab() {
    switch (_selectedTabIndex) {
      case 0:
        return birthVaccines;
      case 1:
        return twoMonthsVaccines;
      case 2:
        return fourMonthsVaccines;
      case 3:
        return sixMonthsVaccines;
      case 4:
        return nineMonthsVaccines;
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.onSecondary,
        leading: Column(
          children: [
            5.ph,
            IconButton(
              onPressed: () => GoRouter.of(context).go(AppRoutes.mainNavigationBarScreen),
              icon: SvgPicture.asset(
                "assets/icons/back_arrow.svg",
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                  AppColors.onPrimaryFixed,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
        title: Column(
          children: [
            // 25.ph,
            Text(
              "Vaccinations",
              style: AppTextStyles.font20SemiBold.copyWith(
                color: AppColors.onPrimaryFixed,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.onSecondary, AppColors.lightBackground],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(children: [
          20.ph,
          VaccinationsTabBar(
            tabs: _tabs,
            selectedIndex: _selectedTabIndex,
            onTabSelected: (index) {
              setState(() {
                _selectedTabIndex = index;
              });
            },
          ),
          15.ph,
          Expanded(
            child: Builder(
              builder: (_) {
                final vaccines = _getVaccinesForTab();

                return vaccines.isEmpty
                    ? const Center(
                  child: Text("No vaccines data for this month."),
                )
                    : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: vaccines.length,
                  itemBuilder: (_, index) => VaccineCard(
                    vaccine: vaccines[index],
                  ),
                );
              },
            ),
          ),

        ]),
      ),
    );
  }
}
