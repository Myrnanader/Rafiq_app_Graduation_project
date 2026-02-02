import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../core/helpers/extensions.dart';
import '../../../core/routing/app_routes.dart';
import '../../../core/theme/app_texts/app_text_styles.dart';
import '../../../core/theming/app_colors.dart';
import '../widgets/widgets/confirmation_dialog.dart';
import '../widgets/widgets/settings_item.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  void _showConfirmationDialog(BuildContext context, String title, String content, VoidCallback onConfirm) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmationDialog(
          title: title,
          content: content,
          onConfirm: onConfirm,
        );
      },
    );
  }

  static void _notImplemented() {
    print("Function not implemented yet.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  icon: Icons.person_outline,
                  title: 'Edit Profile',
                  onTap: () {
                    // context.push(AppRoutes.editProfileScreen);
                  },
                ),
                const Divider(indent: 20, endIndent: 25),

                SettingsItem(
                  icon: Icons.security,
                  title: 'Security',
                  onTap: _notImplemented,
                ),
                const Divider(indent: 20, endIndent: 25),

                SettingsItem(
                  icon: Icons.notifications_none,
                  title: 'Notifications',
                  onTap: () {
                    context.push(AppRoutes.notificationScreen);
                  }
                ),
                const Divider(indent: 20, endIndent: 25),

                SettingsItem(
                  icon: Icons.lock_outline,
                  title: 'Privacy',
                  onTap: _notImplemented,
                ),
                const Divider(indent: 20, endIndent: 25),

                SettingsItem(
                  icon: Icons.info_outline,
                  title: 'About Us',
                  onTap: _notImplemented,
                ),
                const Divider(indent: 20, endIndent: 25),

                SettingsItem(
                  icon: Icons.vpn_key_outlined,
                  title: 'Change Password',
                  onTap: () {
                    context.push(AppRoutes.changePasswordScreen);
                  },
                ),
                const Divider(indent: 20, endIndent: 25),

                SettingsItem(
                  icon: Icons.delete_outline,
                  title: 'Delete account',
                  color: Colors.red,
                  onTap: () => _showConfirmationDialog(
                    context,
                    "Do You Want to delete account?",
                    "This action can't be undone. All your data will be permanently removed.",
                        () {
                      print("Account Deleted!");
                    },
                  ),
                ),
                const Divider(indent: 20, endIndent: 25),

                SettingsItem(
                  icon: Icons.logout,
                  title: 'Log out',
                  color: Colors.red,
                  onTap: () => _showConfirmationDialog(
                    context,
                    "Do You Want to log out?",
                    "You'll need to sign in again to access your account.",
                        () {
                      print("User Logged Out!");
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
