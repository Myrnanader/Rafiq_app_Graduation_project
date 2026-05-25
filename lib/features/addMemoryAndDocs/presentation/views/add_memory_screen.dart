import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../mother/presentation/widgets/widgets/custom_input_field.dart';
import '../cubit/memory_cubit.dart';

class AddMemoryScreen extends StatefulWidget {
  const AddMemoryScreen({super.key});

  @override
  State<AddMemoryScreen> createState() => _AddMemoryScreenState();
}

class _AddMemoryScreenState extends State<AddMemoryScreen> {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  String? imagePath;
  String? imageName;

  Future<void> pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        imagePath = result.files.first.path;
        imageName = result.files.first.name;
      });
    }
  }

  void uploadMemory() {
    if (titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter title")),
      );
      return;
    }

    context.read<MemoriesCubit>().uploadMemory(
      title: titleController.text.trim(),
      description: descController.text.trim(),
      date: DateTime.now().toString(),
      imagePath: imagePath,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MemoriesCubit, MemoriesState>(
      listener: (context, state) {
        if (state is UploadMemorySuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Memory uploaded ✅")),
          );
          Navigator.pop(context);
        }

        if (state is MemoriesError) {
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
            onPressed: () => Navigator.pop(context),
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
            "Add Memory",
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

                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: imagePath != null
                          ? Image.file(
                        File(imagePath!),
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                          : Image.asset(
                        "assets/images/memory.png",
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    10.ph,

                    ElevatedButton(
                      onPressed: pickImage,
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
                        imagePath == null ? 'Choose Image' : 'Change Image',
                        style: AppTextStyles.font14Medium.copyWith(
                          color: AppColors.lightBackground,
                        ),
                      ),
                    ),

                    20.ph,

                    if (imageName != null)
                      Text(
                        imageName!,
                        style: const TextStyle(fontSize: 12),
                      ),

                    40.ph,

                    CustomInputField(
                      controller: titleController,
                      title: 'Title',
                      hint: "First memory",
                    ),

                    15.ph,

                    CustomInputField(
                      controller: descController,
                      title: 'Description',
                      hint: 'write your description here',
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: uploadMemory,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: BlocBuilder<MemoriesCubit, MemoriesState>(
                    builder: (context, state) {
                      if (state is MemoriesLoading) {
                        return const CircularProgressIndicator(
                          color: Colors.white,
                        );
                      }

                      return Text(
                        'Add Memory',
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
