/*import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';
import '../widgets/vaccine_card.dart';
import '../widgets/vaccine_tab_bar_widget.dart';
import '../widgets/vaccines_data.dart';

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
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';
import '../cubit/vaccinations_cubit.dart';
import '../cubit/vaccinations_state.dart';
import '../widgets/vaccine_card.dart';
import '../widgets/vaccine_tab_bar_widget.dart';
import '../widgets/vaccine_item.dart';

class VaccinationsScreen extends StatefulWidget {
  final String childId;

  const VaccinationsScreen({super.key, required this.childId});

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

  @override
  void initState() {
    super.initState();
    context.read<VaccinationsCubit>().getVaccines(widget.childId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.onSecondary,
        leading: IconButton(
          onPressed: () => GoRouter.of(context).pop,
          icon: SvgPicture.asset(
            "assets/icons/back_arrow.svg",
            width: 20,
            height: 20,
          ),
        ),
        title: Text(
          "Vaccinations",
          style: AppTextStyles.font20SemiBold.copyWith(
            color: AppColors.onPrimaryFixed,
          ),
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
        child: BlocBuilder<VaccinationsCubit, VaccinationsState>(
          builder: (context, state) {
            /// 🔄 Loading
            if (state is VaccinationsLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            /// ❌ Error
            if (state is VaccinationsError) {
              return Center(child: Text(state.message));
            }

            /// ✅ Success
            if (state is VaccinationsSuccess) {
              final cubit = context.read<VaccinationsCubit>();

              final vaccines = cubit.vaccines
                  .where((v) => v.ageGroup == _tabs[_selectedTabIndex])
                  .map((e) => VaccineItem(
                        e.id,
                        e.vaccineName,
                        e.dueDate,
                        e.scheduledDate ?? "Not yet",
                        !e.isTaken,
                      ))
                  .toList();

              return Column(
                children: [
                  20.ph,

                  /// Tabs
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

                  /// List
                  Expanded(
                    child: vaccines.isEmpty
                        ? const Center(
                            child: Text("No vaccines for this age group"),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.all(16),
                            itemCount: vaccines.length,
                            itemBuilder: (_, index) => VaccineCard(
                              vaccine: vaccines[index],
                            ),
                          ),
                  ),
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}