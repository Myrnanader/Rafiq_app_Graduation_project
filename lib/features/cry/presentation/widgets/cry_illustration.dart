import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafiq_app/core/utils/app_images.dart';

class CryIllustration extends StatelessWidget {
  const CryIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.babyCry,
      height: 200.h,
      fit: BoxFit.contain,
    );
  }
}