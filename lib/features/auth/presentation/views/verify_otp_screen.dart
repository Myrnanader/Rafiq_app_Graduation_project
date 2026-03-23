import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:rafiq_app/core/common/widgets/custom_app_bar.dart';
import 'package:rafiq_app/core/common/widgets/custom_button.dart';
import 'package:rafiq_app/core/common/widgets/custom_snack_bar.dart';
import 'package:rafiq_app/core/di/di.dart';
import 'package:rafiq_app/core/helpers/extensions.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/features/auth/data/repository/auth_repository.dart';
import 'package:rafiq_app/features/auth/presentation/cubit/auth_cubit.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  late TextEditingController controller;
  String otp = "";

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = GoRouterState.of(context).extra as Map<String, dynamic>;
    final String email = data["email"] as String;
    final String type = data["type"] as String;

    return BlocProvider(
      create: (_) => AuthCubit(AuthRepository(getIt()), getIt()),
      child: Scaffold(
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
                  children: [
                    34.h.ph,

                    CustomAppBar(
                      text: type == "register"
                          ? "Verify Email"
                          : "Verify OTP",
                    ),

                    40.h.ph,

                    PinCodeTextField(
                      appContext: context,
                      length: 4,
                      controller: controller,
                      onChanged: (v) => otp = v,
                      /// ✅ لو عايزة keyboard يظهر تلقائياً
                      autoFocus: true,
                    ),

                    const Spacer(),

                    state is AuthLoading
                        ? const CircularProgressIndicator()
                        : CustomButton(
                            text: "Verify",
                            onTap: () {
                              /// ✅ FIX: Validate إن الـ OTP اتكتب كامل
                              if (otp.length < 4) {
                                CustomSnackBar.show(
                                  context,
                                  "Please enter the 4-digit code",
                                );
                                return;
                              }

                              if (type == "register") {
                                context.read<AuthCubit>().verifyRegistration(
                                      email: email,
                                      otp: otp,
                                    );
                              } else {
                                context.read<AuthCubit>().verifyOtp(
                                      email: email,
                                      otp: otp,
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
      ),
    );
  }
}