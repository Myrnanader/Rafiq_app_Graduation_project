import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/features/cry/presentation/widgets/cry_section_header.dart';
import '../widgets/cry_app_bar.dart';
import '../widgets/cry_illustration.dart';
import '../widgets/cry_progress_bar.dart';

class CryProgressScreen extends StatefulWidget {
  const CryProgressScreen({super.key});

  @override
  State<CryProgressScreen> createState() => _CryProgressScreenState();
}

class _CryProgressScreenState extends State<CryProgressScreen> {
  double progress = 0.0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startFakeRecording();
  }

  void _startFakeRecording() {
    _timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      if (progress >= 1.0) {
        timer.cancel();
        context.go(AppRoutes.cryResultScreen);
      } else {
        setState(() {
          progress += 0.1;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradientBackground(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              163.h.verticalSpace,
              const CrySectionHeader(
                title: 'Analyze cry pattern...... ',
                subtitle: 'We’ll help you understand what your baby might need',
              ),
              19.h.verticalSpace,
              const CryIllustration(),
              const Spacer(),
              CryProgressBar(value: progress),
              11.h.verticalSpace,
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Recording', style: AppTextStyles.font14Medium),
              ),
              111.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
