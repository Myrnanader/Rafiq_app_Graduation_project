import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/routing/app_routes.dart';
import '../../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../cubit/document_cubit.dart';

class UploadFileWidget extends StatelessWidget {
  const UploadFileWidget({super.key});

  Future<void> pickAndUpload(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );

    if (result == null || result.files.isEmpty) return;

    final file = result.files.first;

    if (file.path == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to pick file")),
      );
      return;
    }

    context.read<DocumentsCubit>().uploadDocument(
      title: file.name,
      description: "Uploaded from app",
      date: DateTime.now().toString(),
      filePath: file.path!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DocumentsCubit, DocumentsState>(
      listener: (context, state) {
        if (state is UploadDocumentSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Upload successful ✅")),
          );
        }

        if (state is DocumentsError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: DottedBorder(
        color: AppColors.primary,
        strokeWidth: 1.5,
        dashPattern: const [10, 10],
        borderType: BorderType.RRect,
        radius: const Radius.circular(10),
        child: Column(
          children: [
            15.ph,
            Image.asset(
              "assets/images/upload.png",
              width: 80,
              height: 85,
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Choose a file ",
                  style: AppTextStyles.font16SemiBold.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                Text(
                  "(jpeg, png, pdf)",
                  style: AppTextStyles.font11SemiBold.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () async {
                final result = await context.push(AppRoutes.addDocScreen);

                if (result == true) {
                  context.read<DocumentsCubit>().getDocuments();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Upload',
                style: AppTextStyles.font9Medium.copyWith(
                  color: AppColors.lightBackground,
                ),
              ),
            ),

            10.ph,
          ],
        ),
      ),
    );
  }
}
