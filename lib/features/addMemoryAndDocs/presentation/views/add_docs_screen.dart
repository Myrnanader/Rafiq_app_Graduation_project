import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../mother/presentation/widgets/widgets/custom_input_field.dart';
import '../cubit/document_cubit.dart';

class AddDocScreen extends StatefulWidget {
  const AddDocScreen({super.key});

  @override
  State<AddDocScreen> createState() => _AddDocScreenState();
}

class _AddDocScreenState extends State<AddDocScreen> {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  String? filePath;
  String? fileName;

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        filePath = result.files.first.path;
        fileName = result.files.first.name;
      });
    }
  }

  void uploadDoc() {
    if (filePath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a file")),
      );
      return;
    }

    if (titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter title")),
      );
      return;
    }

    context.read<DocumentsCubit>().uploadDocument(
      title: titleController.text.trim(),
      description: descController.text.trim(),
      date: DateTime.now().toString(),
      filePath: filePath ?? "assets/images/upload-doc.jpg",
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DocumentsCubit, DocumentsState>(
      listener: (context, state) {
        if (state is UploadDocumentSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Uploaded successfully ✅")),
          );
          context.read<DocumentsCubit>().getDocuments();
          GoRouterHelper(context).pop(true);
        }

        if (state is DocumentsError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.lightSurface,
        appBar: AppBar(
          backgroundColor: AppColors.lightSurface,
          leading: IconButton(
            onPressed: () => GoRouterHelper(context).pop(),
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
          title: Text(
            "Upload Document",
            style: AppTextStyles.font20SemiBold.copyWith(
              color: AppColors.onPrimaryFixed,
            ),
          ),
          centerTitle: true,
        ),

        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    40.ph,

                    /// 📷 Preview image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: filePath != null
                          ? Image.file(
                        File(filePath!),
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                          : Image.asset(
                        "assets/images/upload-doc.jpg",
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    10.ph,

                    /// 🔄 Change image
                    ElevatedButton(
                      onPressed: pickFile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 48,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        filePath == null ? 'Choose File' : 'Change File',
                        style: AppTextStyles.font14Medium.copyWith(
                          color: AppColors.lightBackground,
                        ),
                      ),
                    ),

                    20.ph,

                    if (fileName != null)
                      Text(
                        fileName!,
                        style: const TextStyle(fontSize: 12),
                      ),

                    40.ph,

                    /// 📝 Title
                    CustomInputField(
                      controller: titleController,
                      title: 'Title',
                      hint: "First memory",
                    ),

                    15.ph,

                    /// 📝 Description
                    CustomInputField(
                      controller: descController,
                      title: 'Description',
                      hint: 'write your description here',
                    ),

                    5.ph,
                  ],
                ),
              ),
            ),

            /// 🚀 Upload Button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: uploadDoc,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: BlocBuilder<DocumentsCubit, DocumentsState>(
                    builder: (context, state) {
                      if (state is DocumentsLoading) {
                        return const CircularProgressIndicator(
                          color: Colors.white,
                        );
                      }

                      return Text(
                        'Add document',
                        style: AppTextStyles.font16Medium.copyWith(
                          color: AppColors.lightBackground,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            20.ph,
          ],
        ),
      ),
    );
  }
}
