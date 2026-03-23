import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/custom_app_bar.dart';
import 'package:rafiq_app/core/common/widgets/custom_button.dart';
import 'package:rafiq_app/core/common/widgets/custom_snack_bar.dart';
import 'package:rafiq_app/core/di/di.dart';
import 'package:rafiq_app/core/helpers/extensions.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/features/auth/data/models/auth_register_data.dart';
import 'package:rafiq_app/features/auth/data/models/register_request.dart';
import 'package:rafiq_app/features/auth/data/repository/auth_repository.dart';
import 'package:rafiq_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:rafiq_app/features/auth/presentation/widgets/widgets/auth_pregnancy_week_dropdown.dart';

class MotherInformationScreen extends StatefulWidget {
  const MotherInformationScreen({super.key});

  @override
  State<MotherInformationScreen> createState() =>
      _MotherInformationScreenState();
}

class _MotherInformationScreenState extends State<MotherInformationScreen> {
  String? selectedWeek;

  @override
  Widget build(BuildContext context) {
    final data = GoRouterState.of(context).extra as AuthRegisterData?;

    if (data == null) {
      return const Scaffold(
        body: Center(child: Text("Something went wrong")),
      );
    }

    /// ✅ FIX: العنوان بيختلف حسب الـ role
    final bool isMother = data.profileType == "MotherProfile";
    final String screenTitle =
        isMother ? "Mother Information" : "Complete Profile";

    return BlocProvider(
      create: (context) => AuthCubit(AuthRepository(getIt()), getIt()),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is RegisterNeedsVerification) {
                context.push(
                  AppRoutes.verifyOtpScreen,
                  extra: {"email": state.email, "type": "register"},
                );
              }

              if (state is AuthError) {
                /// ✅ FIX: لو user موجود → روح OTP
                if (state.message.toLowerCase().contains("exists")) {
                  context.push(
                    AppRoutes.verifyOtpScreen,
                    extra: {
                      "email": data.email ?? "",
                      "type": "register",
                    },
                  );
                } else {
                  /// ✅ FIX: استخدم CustomSnackBar بدل ScaffoldMessenger مباشرة
                  CustomSnackBar.show(context, state.message);
                }
              }
            },
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    34.h.ph,

                    CustomAppBar(
                      text: screenTitle, // ✅ Dynamic title
                      backRoute: AppRoutes.selectRoleScreen,
                    ),

                    100.h.ph,

                    /// ✅ الـ Dropdown بس للـ Mother
                    if (isMother)
                      AuthPregnancyWeekDropdown(
                        onChanged: (value) {
                          setState(() {
                            selectedWeek = value.toString();
                          });
                        },
                      ),

                    /// ✅ للـ Father - رسالة بسيطة
                    if (!isMother)
                      Text(
                        "You're all set! Tap continue to complete registration.",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),

                    const Spacer(),

                    state is AuthLoading
                        ? const CircularProgressIndicator()
                        : CustomButton(
                            text: 'Continue',
                            onTap: () {
                              /// ✅ Validation للـ Mother فقط
                              if (isMother && selectedWeek == null) {
                                CustomSnackBar.show(
                                  context,
                                  "Please select your pregnancy week",
                                );
                                return;
                              }

                              if (isMother) {
                                data.pregnancyWeek =
                                    int.parse(selectedWeek!);
                              }

                              final request = RegisterRequest(
                                fullName: data.fullName!,
                                email: data.email!,
                                password: data.password!,
                                dateOfBirth: data.dateOfBirth!,
                                role: data.role!,
                                profileType: data.profileType!,
                                /// ✅ pregnancyWeek = null للـ Father
                                pregnancyWeek: isMother
                                    ? data.pregnancyWeek
                                    : null,
                              );

                              context.read<AuthCubit>().register(request);
                            },
                          ),

                    56.h.ph,
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