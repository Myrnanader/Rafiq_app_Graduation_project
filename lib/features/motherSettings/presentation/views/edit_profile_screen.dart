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
  /// ✅ فصلنا firstName و lastName بدل Full Name field واحدة
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _dobController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  void _submit(BuildContext context) {
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final email = _emailController.text.trim();
    final dob = _dobController.text.trim();

    /// ✅ Client-side validation قبل إرسال الـ request
    if (firstName.isEmpty) {
      _showSnack(context, "First name is required");
      return;
    }
    if (lastName.isEmpty) {
      _showSnack(context, "Last name is required");
      return;
    }
    if (email.isEmpty || !email.contains('@')) {
      _showSnack(context, "Please enter a valid email");
      return;
    }
    if (dob.isEmpty) {
      _showSnack(context, "Date of birth is required");
      return;
    }

    context.read<MotherSettingsCubit>().editProfile(
          EditProfileRequest(
            firstName: firstName,
            lastName: lastName,
            email: email,
            /// ✅ الـ dob بيجي ISO 8601 UTC من الـ DateOfBirthField مباشرة
            dateOfBirth: dob,
          ),
        );
  }

  void _showSnack(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MotherSettingsCubit, MotherSettingsState>(
      listener: (context, state) {
        if (state is EditProfileSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Profile updated successfully"),
              backgroundColor: Colors.green,
            ),
          );
          context.pop();
        }

        if (state is EditProfileError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
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
        body: BlocBuilder<MotherSettingsCubit, MotherSettingsState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        50.ph,

                        /// ✅ firstName field منفصلة
                        CustomInputField(
                          title: 'First Name',
                          hint: "Maram",
                          controller: _firstNameController,
                        ),

                        /// ✅ lastName field منفصلة
                        CustomInputField(
                          title: 'Last Name',
                          hint: "Mohammed",
                          controller: _lastNameController,
                        ),

                        CustomInputField(
                          title: 'Email',
                          hint: "Maram@gmail.com",
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                        ),

                        /// ✅ DateOfBirthField بتحفظ ISO في الـ controller
                        DateOfBirthField(controller: _dobController),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: state is EditProfileLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                            onPressed: () => _submit(context),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15),
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
            );
          },
        ),
      ),
    );
  }
}