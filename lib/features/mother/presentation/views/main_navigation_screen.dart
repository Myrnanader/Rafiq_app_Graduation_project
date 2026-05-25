import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets/custom_bottom_navigation_bar.dart';
import '../widgets/widgets/nav_bar_page_selector.dart';
import '../../../auth/presentation/cubit/user_cubit.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    final userState = context.watch<UserCubit>().state;

    final isAdmin = userState is UserLoaded &&
        userState.profile.role == "Admin";

    return Scaffold(
      body: NavBarPageSelector.getPage(
        _currentIndex,
        isAdmin: isAdmin,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onItemSelected: (index) => setState(() {
          _currentIndex = index;
        }),
      ),
    );
  }
}