import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../mother/presentation/widgets/widgets/custom_input_field.dart';
import '../cubit/food_cubit.dart';
import '../cubit/food_state.dart';

class AddFoodScreen extends StatefulWidget {
  const AddFoodScreen({super.key});

  @override
  State<AddFoodScreen> createState() => _AddFoodScreenState();
}

class _AddFoodScreenState extends State<AddFoodScreen> {
  final nameController = TextEditingController();
  final descController = TextEditingController();

  String? imagePath;
  String? imageName;
  int selectedCategory = 0;

  Future<void> pickImage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        imagePath = result.files.first.path;
        imageName = result.files.first.name;
      });
    }
  }

  void uploadFood() {
    if (nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please enter name")));
      return;
    }

    if (descController.text.trim().isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please enter description")));
      return;
    }

    context.read<FoodsCubit>().createFood(
      name: nameController.text.trim(),
      description: descController.text.trim(),
      imageUrl: imagePath ?? "",
      category: selectedCategory,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FoodsCubit, FoodsState>(
      listener: (context, state) {
        if (state is FoodCreated) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Food created ✅")));
          Navigator.pop(context);
        }

        if (state is FoodCreateError) {
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
            "Add Food",
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
                child: Padding(
                  padding: const EdgeInsets.all(20),
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
                          "assets/images/food.png",
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
                        controller: nameController,
                        title: 'Name',
                        hint: "Add Name like Spinach",
                      ),
                      CustomInputField(
                        controller: descController,
                        title: 'Description',
                        hint: "Rich in iron and folate",
                      ),
                
                      Row(
                        children: [
                          Text(
                            "Category",
                            style: AppTextStyles.font16Medium.copyWith(
                              color: AppColors.onPrimaryFixed,
                            ),
                          ),
                          12.pw,
                          DropdownButton<int>(
                            value: selectedCategory,
                            items: const [
                              DropdownMenuItem(value: 0, child: Text("Vegetables")),
                              DropdownMenuItem(value: 1, child: Text("Proteins")),
                              DropdownMenuItem(value: 2, child: Text("Fruits")),
                              DropdownMenuItem(value: 3, child: Text("Dairy")),
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedCategory = value!;
                              });
                            },
                          ),
                        ],
                      ),
                
                      20.ph,
                
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: uploadFood,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: BlocBuilder<FoodsCubit, FoodsState>(
                              builder: (context, state) {
                                if (state is FoodsLoading) {
                                  return const CircularProgressIndicator(
                                    color: AppColors.primary,
                                  );
                                }
                
                                return Text(
                                  'Add Food',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
