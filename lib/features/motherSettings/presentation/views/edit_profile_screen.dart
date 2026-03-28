import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/common/widgets/date_of_birth_feild.dart';
import 'package:rafiq_app/features/mother/presentation/widgets/widgets/custom_input_field.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/theming/app_colors.dart';
import '../../data/models/edit_profile_request.dart';
import '../cubit/mother_settings_cubit.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<MotherSettingsCubit, MotherSettingsState>(
      listener: (context, state) {
        /// ✅ SUCCESS
        if (state is EditProfileSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Profile updated")),
          );
          context.pop();
        }

        /// ❌ ERROR
        if (state is EditProfileError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.lightSurface,
        appBar: AppBar(
          backgroundColor: AppColors.lightSurface,
          leading: Column(
            children: [
              5.ph,
              IconButton(
                onPressed: () => context.pop(),
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
          title: Text(
            "Edit Profile",
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
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    50.ph,

                    /// 👤 FULL NAME
                    CustomInputField(
                      title: 'Full Name',
                      hint: "Maram Mohammed",
                      controller: nameController,
                    ),

                    ///  EMAIL
                    CustomInputField(
                      title: 'Email',
                      hint: "Maram@gmail.com",
                      controller: emailController,
                    ),

                    ///  DATE OF BIRTH ( باستخدام الwidget الجاهزة)
                    DateOfBirthField(controller: dobController),
                  ],
                ),
              ),
            ),

            /// 🔘 SAVE BUTTON
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final fullName =
                        nameController.text.trim().split(" ");

                    context.read<MotherSettingsCubit>().editProfile(
                          EditProfileRequest(
                            firstName: fullName.first,
                            lastName:
                                fullName.length > 1 ? fullName.last : "",
                            email: emailController.text.trim(),
                            /// ✅ ISO جاي من الwidget مباشرة
                            dateOfBirth: dobController.text,
                          ),
                        );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Save Changes',
                    style: AppTextStyles.font16Medium.copyWith(
                      color: AppColors.lightBackground,
                    ),
                  ),
                ),
              ),
            ),
            40.ph,
          ],
        ),
      ),
    );
  }
}