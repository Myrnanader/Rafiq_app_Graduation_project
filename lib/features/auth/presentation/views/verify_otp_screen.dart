import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rafiq_app/core/common/widgets/custom_app_bar.dart';
import 'package:rafiq_app/core/common/widgets/custom_button.dart';
import 'package:rafiq_app/core/common/widgets/custom_snack_bar.dart';
import 'package:rafiq_app/core/helpers/extensions.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/features/auth/presentation/cubit/auth_cubit.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  late TextEditingController _pinController;
  String _otp = "";

  @override
  void initState() {
    super.initState();
    _pinController = TextEditingController();
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = GoRouterState.of(context).extra as Map<String, dynamic>;

    final String email = data["email"] as String;
    final String type = data["type"] as String;

    final String fullName = (data["fullName"] as String?)?.trim() ?? "";
    final int? pregnancyWeek = data["pregnancyWeek"] as int?;

    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is OtpVerified) {
              if (type == "register") {
                context.go(AppRoutes.accountCreatedSuccessfullyScreen);
              } else {
                context.push(
                  AppRoutes.createNewPasswordScreen,
                  extra: {"email": email},
                );
              }
            }
            if (state is AuthError) {
              CustomSnackBar.show(context, state.message);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  34.h.ph,
                  const CustomAppBar(text: "Verify Your Email"),
                  40.h.ph,
                  Text(
                    "OTP Code",
                    style: AppTextStyles.font14Regular.copyWith(
                      color: AppColors.onSurfaceLight,
                    ),
                  ),
                  16.h.ph,
                  PinCodeTextField(
                    appContext: context,
                    length: 4,
                    controller: _pinController,
                    autoFocus: true,
                    keyboardType: TextInputType.number,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8.r),
                      fieldHeight: 56.h,
                      fieldWidth: 56.w,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      activeColor: AppColors.onPrimary,
                      inactiveColor: Colors.grey.shade300,
                      selectedColor: AppColors.onPrimary,
                      borderWidth: 1.5,
                    ),
                    enableActiveFill: true,
                    onChanged: (v) => _otp = v,
                  ),
                  24.h.ph,
                  const Spacer(),
                  state is AuthLoading
                      ? const Center(child: CircularProgressIndicator())
                      : CustomButton(
                          text: "Verify",
                          onTap: () {
                            if (_otp.length < 4) {
                              CustomSnackBar.show(
                                  context, "Enter 4-digit code");
                              return;
                            }

                            if (type == "register") {
                              context.read<AuthCubit>().verifyRegistration(
                                    email: email,
                                    otp: _otp,
                                    fullName: fullName,
                                    pregnancyWeek: pregnancyWeek,
                                  );
                            } else {
                              context.read<AuthCubit>().verifyOtp(
                                    email: email,
                                    otp: _otp,
                                  );
                            }
                          },
                        ),
                  40.h.ph,
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}