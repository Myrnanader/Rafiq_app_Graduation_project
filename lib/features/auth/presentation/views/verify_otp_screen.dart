import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rafiq_app/core/common/widgets/custom_app_bar.dart';
import 'package:rafiq_app/core/common/widgets/custom_button.dart';
import 'package:rafiq_app/core/common/widgets/custom_snack_bar.dart';
import 'package:rafiq_app/core/helpers/extensions.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/features/auth/presentation/widgets/widgets/custom_outh_footer.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  late TextEditingController pinCodeController;
  String otpCode = "";

  @override
  void initState() {
    super.initState();
    pinCodeController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              34.h.ph,
              const CustomAppBar(
                text: 'Verify Your Email',
                backRoute: AppRoutes.signInScreen,
              ),
              64.h.ph,
              Text('OTP Code', style: AppTextStyles.font16Medium),
              8.h.ph,

              // ✅ PinCodeTextField مع onCompleted
              PinCodeTextField(
                appContext: context,
                length: 6,
                controller: pinCodeController,
                obscureText: false,
                enableActiveFill: true,
                keyboardType: TextInputType.number,
                textStyle: AppTextStyles.font24SemiBold.copyWith(
                  fontSize: 22.sp,
                ),
                cursorColor: AppColors.onPrimary,
                pinTheme: PinTheme(
                  fieldWidth: 48.w,
                  fieldHeight: 48.h,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8.r),
                  selectedColor: AppColors.onPrimary,
                  selectedFillColor: Colors.white,
                  activeColor: AppColors.onBackgroundLight,
                  activeFillColor: Colors.white,
                  inactiveColor: Colors.white,
                  inactiveFillColor: AppColors.onSecondary,
                ),
                onChanged: (value) {
                  otpCode = value;
                },
                onCompleted: (code) {
                  otpCode = code;
                  if (code.length == 6) {
                    context.go(AppRoutes.createNewPasswordScreen);
                  }
                },
              ),

              270.h.ph,
              CustomAuthFooter(
                questionText: "Didn’t receive the code? ",
                actionText: "Re-send",
                route: AppRoutes.signUpScreen,
              ),
              24.h.ph,

              Padding(
                padding: EdgeInsets.only(bottom: 56.h),
                child: CustomButton(
                  text: 'Verify',
                  color: AppColors.primary,
                  onTap: () {
                    if (otpCode.length == 6) {
                      context.go(AppRoutes.createNewPasswordScreen);
                    } else {
                      CustomSnackBar.show(context, 'Please enter the full 6-digit code');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
