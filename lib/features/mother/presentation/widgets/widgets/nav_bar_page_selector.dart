import 'package:flutter/material.dart';

import '../../../../motherSettings/presentation/views/setting_screen.dart';
import '../../views/community_screen.dart';
import '../../views/dashboard_screen.dart';
import '../../views/profile_screen.dart';
import '../../views/admin_community_screen.dart';
import 'package:rafiq_app/features/mother/presentation/views/home_screen.dart';

class NavBarPageSelector {
  static Widget getPage(int currentIndex, {required bool isAdmin}) {
    switch (currentIndex) {
      case 0:
        return HomeScreen();

      case 1:
        return DashboardScreen();

      case 2:
        return isAdmin
            ? const AdminCommunityScreen()
            : const CommunityScreen();

      case 3:
        return ProfileScreen();

      case 4:
        return SettingScreen();

      default:
        return HomeScreen();
    }
  }
}