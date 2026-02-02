import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/features/mother/widgets/widgets/food_card.dart';

import '../../../core/helpers/extensions.dart';
import '../../../core/theme/app_texts/app_text_styles.dart';
import '../../../core/theming/app_colors.dart';
import '../widgets/widgets/food_data.dart';
import '../widgets/widgets/food_tab_bar_widget.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  int _selectedTabIndex = 0;

  final List<String> _tabs = [
    "Vegetables",
    "Proteins",
    "Fruits",
    "Dairy",
  ];

  List _getFoodsForTab() {
    switch (_selectedTabIndex) {
      case 0:
        return Vegetables;
      case 1:
        return Proteins;
      case 2:
        return Fruits;
      case 3:
        return Dairy;
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightSurface,
      appBar: AppBar(
        backgroundColor: AppColors.lightSurface,
        leading: Column(
          children: [
            5.ph,
            IconButton(
              onPressed: () => GoRouter.of(context).pop(),
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
            25.ph,
            Text(
              "Foods",
              style: AppTextStyles.font20SemiBold.copyWith(
                color: AppColors.onPrimaryFixed,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        20.ph,
        FoodTabBar(
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
              final food = _getFoodsForTab();

              return food.isEmpty
                  ? const Center(
                child: Text("No Foods data for this month."),
              )
                  : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: food.length,
                itemBuilder: (_, index) => FoodCard(
                  food: food[index],
                ),
              );
            },
          ),
        ),

      ]),    );
  }
}
