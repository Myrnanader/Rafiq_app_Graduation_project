import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/theming/app_colors.dart';

class AddExperienceScreen extends StatefulWidget {
  const AddExperienceScreen({super.key});

  @override
  AddExperienceScreenState createState() => AddExperienceScreenState();
}

class AddExperienceScreenState extends State<AddExperienceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Column(
          children: [
            8.ph,
            Text(
              "Add Your Experience",
              style: AppTextStyles.font20SemiBold.copyWith(
                color: AppColors.onPrimaryFixed,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  30.ph,
                  Text(
                    'What was the challenge you faced?',
                    style: AppTextStyles.font16Medium.copyWith(
                      color: AppColors.onPrimaryFixed,
                    ),
                  ),
                  TextFormField(
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Enter your challenge... ',
                      hintStyle: AppTextStyles.font12Regular.copyWith(
                        color: AppColors.neutralGray,
                      ),
                      filled: true,
                      fillColor: AppColors.lightSurface,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: AppColors.silver,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: AppColors.silver,
                          width: 1.5,
                        ),
                      ),
                    ),
                    style: AppTextStyles.font14Medium.copyWith(
                      color: AppColors.onPrimaryFixed,
                    ),
                  ),
                  8.ph,
                  Text(
                    'How did you deal with it?',
                    style: AppTextStyles.font16Medium.copyWith(
                      color: AppColors.onPrimaryFixed,
                    ),
                  ),
                  TextFormField(
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Enter your solution... ',
                      hintStyle: AppTextStyles.font12Regular.copyWith(
                        color: AppColors.neutralGray,
                      ),
                      filled: true,
                      fillColor: AppColors.lightSurface,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: AppColors.silver,
                          width: 1.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: AppColors.silver,
                          width: 1.5,
                        ),
                      ),
                    ),
                    style: AppTextStyles.font14Medium.copyWith(
                      color: AppColors.onPrimaryFixed,
                    ),
                  )



                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Add Experience',
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
    );
  }
}
