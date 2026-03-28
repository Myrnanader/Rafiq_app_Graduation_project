import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq_app/core/di/di.dart';
import 'package:rafiq_app/features/auth/presentation/widgets/widgets/email_feild_widget.dart';
import 'package:rafiq_app/features/mother/data/models/link_father_request.dart';
import 'package:rafiq_app/features/mother/presentation/cubit/mother_profile_cubit.dart';
import 'package:rafiq_app/features/mother/presentation/cubit/mother_profile_state.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';


import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/theming/app_colors.dart';

class AddFatherIdScreen extends StatefulWidget {
  const AddFatherIdScreen({super.key});

  @override
  AddFatherIdScreenState createState() => AddFatherIdScreenState();
}

class AddFatherIdScreenState extends State<AddFatherIdScreen> {
  final TextEditingController controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<MotherProfileCubit, MotherProfileState>(
      listener: (context, state) {
        if (state is LinkFatherSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Father linked successfully")),
          );

          context.pop(); 
        }

        if (state is LinkFatherError) {
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
            "Add Father Email",
            style: AppTextStyles.font20SemiBold.copyWith(
              color: AppColors.onPrimaryFixed,
            ),
          ),
          centerTitle: true,
        ),
        body: Form(
          key: formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      50.ph,
                      EmailField(controller: controller),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (!formKey.currentState!.validate()) return;

                      context.read<MotherProfileCubit>().linkFather(
                            LinkFatherRequest(
                              fatherEmail: controller.text.trim(),
                            ),
                          );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding:
                          const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Save',
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
      ),
    );
  }
}