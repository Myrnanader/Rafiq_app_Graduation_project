import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  final String text;

  ///  نخليه nullable
  final String? backRoute;

  const CustomAppBar({
    super.key,
    required this.text,
    this.backRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else if (backRoute != null) {
              context.go(backRoute!);
            }
          },
          icon: const Icon(Icons.arrow_back),
        ),

        const SizedBox(width: 8),

        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}