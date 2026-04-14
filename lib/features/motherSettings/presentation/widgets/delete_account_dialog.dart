import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rafiq_app/features/motherSettings/presentation/cubit/mother_settings_cubit.dart';
import 'confirmation_dialog.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MotherSettingsCubit>();

    return ConfirmationDialog(
      title: "Do You Want to delete account?",
      content:
          "This action can't be undone.\n All your data will be permanently removed.",
      onConfirm: () {
        cubit.deleteAccount();
      },
    );
  }
}