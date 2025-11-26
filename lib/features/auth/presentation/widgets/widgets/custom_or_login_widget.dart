
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/helpers/extensions.dart';

class CustomOrLoginWidget extends StatelessWidget {
  const CustomOrLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 153.w, child: Divider()),
        12.h.ph,
        Text(" Or "),
        12.h.ph,
        SizedBox(width: 153.w, child: Divider()),
      ],
    );
  }
}
