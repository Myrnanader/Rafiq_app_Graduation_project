
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomOrLoginWidget extends StatelessWidget {
  const CustomOrLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: const Text("Or"),
        ),

        const Expanded(child: Divider()),
      ],
    );
  }
}
