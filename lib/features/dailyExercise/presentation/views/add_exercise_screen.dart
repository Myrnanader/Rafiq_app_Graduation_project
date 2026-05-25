import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../mother/presentation/widgets/widgets/custom_input_field.dart';
import '../cubit/exercise_cubit.dart';
import '../cubit/exercise_state.dart';

class AddExerciseScreen extends StatefulWidget {
  const AddExerciseScreen({super.key});

  @override
  State<AddExerciseScreen> createState() => _AddExerciseScreenState();
}

class _AddExerciseScreenState extends State<AddExerciseScreen> {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  String? imagePath;
  String? imageName;
  int selectedTrimester = 1;

  Future<void> pickImage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        imagePath = result.files.first.path;
        imageName = result.files.first.name;
      });
    }
  }

  void uploadExercise() {
    if (titleController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please enter title")));
      return;
    }

    if (descController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please enter description")));
      return;
    }

    context.read<ExercisesCubit>().createExercise(
      title: titleController.text.trim(),
      shortSummary: descController.text.trim().length > 50
          ? descController.text.trim().substring(0, 50)
          : descController.text.trim(),
      fullDescription: descController.text.trim(),
      targetTrimester: selectedTrimester,
      imagePath: imagePath,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExercisesCubit, ExercisesState>(
      listener: (context, state) {
        if (state is ExerciseCreated) {
          context.read<ExercisesCubit>()
              .getByTrimester(context.read<ExercisesCubit>().currentTrimester);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Exercise created ✅")));
          Navigator.pop(context);
        }

        if (state is ExerciseCreateError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
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
            "Add Exercise",
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
                    8.ph,
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
                              "assets/images/exercise.png",
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
                      Text(imageName!, style: const TextStyle(fontSize: 12)),

                    20.ph,

                    CustomInputField(
                      controller: titleController,
                      title: 'Title',
                      hint: "Morning Exercise",
                    ),

                    8.ph,

                    CustomInputField(
                      controller: descController,
                      title: 'Description',
                      hint: 'write your description here',
                    ),

                    1.ph,

                    Row(
                      children: [
                        Text(
                          "Target Trimester",
                          style: AppTextStyles.font16Medium.copyWith(
                            color: AppColors.onPrimaryFixed,
                          ),
                        ),
                        12.pw,
                        DropdownButton<int>(
                          value: selectedTrimester,
                          items: const [
                            DropdownMenuItem(value: 1, child: Text("First")),
                            DropdownMenuItem(value: 2, child: Text("Second")),
                            DropdownMenuItem(value: 3, child: Text("Third")),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedTrimester = value!;
                            });
                          },
                        ),
                      ],
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
                  onPressed: uploadExercise,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: BlocBuilder<ExercisesCubit, ExercisesState>(
                    builder: (context, state) {
                      if (state is ExercisesLoading) {
                        return const CircularProgressIndicator(
                          color: AppColors.primary,
                        );
                      }

                      return Text(
                        'Add Exercise',
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
