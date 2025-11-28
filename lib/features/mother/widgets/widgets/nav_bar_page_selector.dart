import 'package:flutter/material.dart';
import 'package:rafiq_app/features/mother/views/home_screen.dart';

import '../../views/community_screen.dart';
import '../../views/dashboard_screen.dart';
import '../../views/profile_screen.dart';
import '../../views/setting_screen.dart';

class NavBarPageSelector {
  static Widget getPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return DashboardScreen();
      case 2:
        return CommunityScreen();
      case 3:
        return ProfileScreen();
      case 4:
        return SettingScreen();
      default:
        return HomeScreen();
    }
  }
}
