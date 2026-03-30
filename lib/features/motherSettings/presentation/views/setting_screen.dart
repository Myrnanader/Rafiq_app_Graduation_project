import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';

import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../presentation/cubit/mother_settings_cubit.dart';

import '../widgets/widgets/confirmation_dialog.dart';
import '../widgets/widgets/settings_item.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  ///  DELETE DIALOG
  void _showDeleteDialog(BuildContext context) {
    final cubit = context.read<MotherSettingsCubit>();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return ConfirmationDialog(
          title: "Do You Want to delete account?",
          content:
              "This action can't be undone.\n All your data will be permanently removed.",
          onConfirm: () {
             cubit.deleteAccount();
           
          },
        );
      },
    );
  }

  ///  LOGOUT DIALOG
  void _showLogoutDialog(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return ConfirmationDialog(
          title: "Do You Want to log out?",
          content: "You'll need to sign in again to access your account.",
          onConfirm: () async {
            await authCubit.logout();

            if (context.mounted) {
              context.go(AppRoutes.signInScreen);
            }
          },
        );
      },
    );
  }

  static void _notImplemented() {}

  @override
  Widget build(BuildContext context) {
    return BlocListener<MotherSettingsCubit, MotherSettingsState>(
      listener: (context, state) async {
        ///  DELETE SUCCESS → Go to Onboarding
        if (state is DeleteAccountSuccess) {
          await context.read<AuthCubit>().logout();

          if (context.mounted) {
            context.go(AppRoutes.onBoardScreen);
          }
        }

        ///  ERROR → Show message only
        if (state is DeleteAccountError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
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

                  /// 🔥 DELETE ACCOUNT
                  SettingsItem(
                    svgIconPath: 'assets/icons/delete.svg',
                    title: 'Delete account',
                    color: Colors.red,
                    onTap: () => _showDeleteDialog(context),
                  ),
                  const Divider(indent: 20, endIndent: 25),

                  /// 🔥 LOGOUT
                  SettingsItem(
                    svgIconPath: 'assets/icons/login.svg',
                    title: 'Log out',
                    color: Colors.red,
                    onTap: () => _showLogoutDialog(context),
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
