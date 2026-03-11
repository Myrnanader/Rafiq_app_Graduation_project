import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theming/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemSelected;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  final List<String> navLabels = const [
    "Home",
    "Dashboard",
    "Community",
    "Profile",
    "Setting",
  ];

  final List<String> navIcons = const [
    "assets/icons/home1.svg",
    "assets/icons/Dashboard.svg",
    "assets/icons/Vector.svg",
    "assets/icons/profile.svg",
    "assets/icons/lsicon_setting-filled.svg",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade50,
            blurRadius: 1,
            offset: Offset(0, -3),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: CurvedNavigationBar(
        index: currentIndex,
        height: 75,
        color: AppColors.lightBackground,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.transparent,
        items: List.generate(navLabels.length, (i) {
          final isActive = i == currentIndex;

          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isActive
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // 10.ph,
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: AppColors.lightBackground,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 2.0,
                                spreadRadius: 0.10,
                                offset: const Offset(0, 3.5),
                              ),
                            ],
                          ),
                          child: SvgPicture.asset(
                            navIcons[i],
                            width: 24,
                            height: 24,
                            colorFilter: ColorFilter.mode(
                              AppColors.primary,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        30.ph,
                        SvgPicture.asset(
                          navIcons[i],
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(
                            AppColors.gray46,
                            BlendMode.srcIn,
                          ),
                        ),
                        5.ph,
                        Text(
                          navLabels[i],
                          style: TextStyle(fontSize: 10, color: AppColors.gray46),
                        ),
                      ],
                    ),
            ],
          );
        }),
        onTap: (index) {
          onItemSelected(index);
        },
      ),
    );
  }
}
