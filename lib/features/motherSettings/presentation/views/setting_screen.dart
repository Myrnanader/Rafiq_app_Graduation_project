import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq_app/features/motherSettings/presentation/widgets/make_admin_dialog.dart';
import 'package:rafiq_app/features/motherSettings/presentation/widgets/delete_account_dialog.dart';
import 'package:rafiq_app/features/motherSettings/presentation/widgets/logout_dialog.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';

import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../presentation/cubit/mother_settings_cubit.dart';

import '../widgets/settings_item.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  static void _notImplemented() {}

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        ///  Mother Settings
        BlocListener<MotherSettingsCubit, MotherSettingsState>(
          listener: (context, state) async {
            /// DELETE SUCCESS
            if (state is DeleteAccountSuccess) {
              await context.read<AuthCubit>().logout();

              if (context.mounted) {
                context.go(AppRoutes.onBoardScreen);
              }
            }

            /// DELETE ERROR
            if (state is DeleteAccountError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }

            /// MAKE ADMIN SUCCESS
            if (state is MakeAdminSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("User promoted to admin")),
              );
            }

            /// MAKE ADMIN ERROR
            if (state is MakeAdminError) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
        ),

        ///  Auth (Logout)
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthInitial) {
              context.go(AppRoutes.signInScreen);
            }
          },
        ),
      ],

      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.lightBackground,
          leading: Column(
            children: [
              5.ph,
              IconButton(
                onPressed: () => GoRouter.of(context).pop(),
                icon: SvgPicture.asset(
                  "assets/icons/back_arrow.svg",
                  width: 20,
                  height: 20,
                  colorFilter: ColorFilter.mode(
                    AppColors.onPrimaryFixed,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
          title: Column(
            children: [
              25.ph,
              Text(
                "Settings",
                style: AppTextStyles.font20SemiBold.copyWith(
                  color: AppColors.onPrimaryFixed,
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            25.ph,
            Expanded(
              child: ListView(
                children: [
                  SettingsItem(
                    svgIconPath: 'assets/icons/user.svg',
                    title: 'Make Admin',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => const MakeAdminDialog(),
                      );
                    },
                  ),
                  const Divider(indent: 20, endIndent: 25),

                  SettingsItem(
                    svgIconPath: 'assets/icons/user.svg',
                    title: 'Edit Profile',
                    onTap: () {
                      context.push(AppRoutes.editProfileScreen);
                    },
                  ),
                  const Divider(indent: 20, endIndent: 25),

                  SettingsItem(
                    svgIconPath: 'assets/icons/security.svg',
                    title: 'Security',
                    onTap: _notImplemented,
                  ),
                  const Divider(indent: 20, endIndent: 25),

                  SettingsItem(
                    svgIconPath: 'assets/icons/bell.svg',
                    title: 'Notifications',
                    onTap: () {
                      context.push(AppRoutes.notificationScreen);
                    },
                  ),
                  const Divider(indent: 20, endIndent: 25),

                  SettingsItem(
                    svgIconPath: 'assets/icons/Lock.svg',
                    title: 'Privacy',
                    onTap: _notImplemented,
                  ),
                  const Divider(indent: 20, endIndent: 25),

                  SettingsItem(
                    svgIconPath: 'assets/icons/about.svg',
                    title: 'About Us',
                    onTap: _notImplemented,
                  ),
                  const Divider(indent: 20, endIndent: 25),

                  SettingsItem(
                    svgIconPath: 'assets/icons/key.svg',
                    title: 'Change Password',
                    onTap: () {
                      context.push(AppRoutes.changePasswordScreen);
                    },
                  ),
                  const Divider(indent: 20, endIndent: 25),

                  ///  DELETE ACCOUNT
                  SettingsItem(
                    svgIconPath: 'assets/icons/delete.svg',
                    title: 'Delete account',
                    color: Colors.red,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => const DeleteAccountDialog(),
                      );
                    },
                  ),
                  const Divider(indent: 20, endIndent: 25),

                  ///  LOGOUT
                  SettingsItem(
                    svgIconPath: 'assets/icons/login.svg',
                    title: 'Log out',
                    color: Colors.red,
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => const LogoutDialog(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
