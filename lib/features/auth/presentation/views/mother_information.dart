import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/custom_app_bar.dart';
import 'package:rafiq_app/core/common/widgets/custom_button.dart';
import 'package:rafiq_app/core/common/widgets/custom_snack_bar.dart';
import 'package:rafiq_app/core/helpers/extensions.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/features/auth/data/models/auth_register_data.dart';
import 'package:rafiq_app/features/auth/data/models/register_request.dart';
import 'package:rafiq_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:rafiq_app/features/auth/presentation/widgets/widgets/auth_pregnancy_week_dropdown.dart';

class MotherInformationScreen extends StatefulWidget {
  const MotherInformationScreen({super.key});

  @override
  State<MotherInformationScreen> createState() =>
      _MotherInformationScreenState();
}

class _MotherInformationScreenState extends State<MotherInformationScreen> {
  int? _selectedWeek;

  @override
  Widget build(BuildContext context) {
    final data = GoRouterState.of(context).extra as AuthRegisterData?;

    if (data == null) {
      return const Scaffold(
        body: Center(child: Text("Something went wrong")),
      );
    }

    final bool isMother = data.profileType == "MotherProfile";

    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is RegisterNeedsVerification) {
              context.push(
                AppRoutes.verifyOtpScreen,
                extra: {
                  "email": state.email,
                  "type": "register",
                  "fullName": data.fullName ?? "",
                  "pregnancyWeek": _selectedWeek,
                },
              );
            }

            if (state is AuthError) {
              if (state.message.toLowerCase().contains("exists")) {
                context.push(
                  AppRoutes.verifyOtpScreen,
                  extra: {
                    "email": data.email ?? "",
                    "type": "register",
                    "fullName": data.fullName ?? "",
                    "pregnancyWeek": _selectedWeek,
                  },
                );
              } else {
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
                    text: isMother
                        ? "Mother Information"
                        : "Complete Profile",
                    backRoute: AppRoutes.selectRoleScreen,
                  ),

                  100.h.ph,

                  if (isMother)
                    AuthPregnancyWeekDropdown(
                      onChanged: (value) {
                        setState(() => _selectedWeek = value);
                      },
                    ),

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
                            if (isMother && _selectedWeek == null) {
                              CustomSnackBar.show(
                                context,
                                "Please select your pregnancy week",
                              );
                              return;
                            }

                            if (isMother) {
                              data.pregnancyWeek = _selectedWeek;
                            }

                            context.read<AuthCubit>().register(
                                  RegisterRequest(
                                    fullName: data.fullName!,
                                    email: data.email!,
                                    password: data.password!,
                                    dateOfBirth: data.dateOfBirth!,
                                    role: data.role!,
                                    profileType: data.profileType!,
                                    pregnancyWeek:
                                        isMother ? data.pregnancyWeek : null,
                                  ),
                                );
                          },
                        ),

                  56.h.ph,
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}