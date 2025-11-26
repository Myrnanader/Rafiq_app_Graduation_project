import 'package:flutter/material.dart';

class OnboardingPageView extends StatelessWidget {
  final PageController controller;
  final ValueChanged<int> onPageChanged;
  final List<Widget> pages;

  const OnboardingPageView({
    required this.controller,
    required this.onPageChanged,
    required this.pages,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      onPageChanged: onPageChanged,
      children: pages,
    );
  }
}