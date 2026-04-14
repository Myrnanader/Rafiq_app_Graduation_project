import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import 'confirmation_dialog.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    return ConfirmationDialog(
      title: "Do You Want to log out?",
      content: "You'll need to sign in again to access your account.",
      onConfirm: () async {
        await authCubit.logout();
        if (context.mounted) {
          Navigator.pop(context);
          
        }
      },
    );
  }
}
