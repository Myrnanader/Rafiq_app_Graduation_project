import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/features/mother/views/weight_input.dart';
import 'package:rafiq_app/features/mother/widgets/widgets/custom_input_field.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theming/app_colors.dart';
import '../widgets/widgets/custom_gender_button.dart';

class BabyProfileScreen extends StatefulWidget {
  const BabyProfileScreen({super.key});

  @override
  _BabyProfileScreenState createState() => _BabyProfileScreenState();
}

class _BabyProfileScreenState extends State<BabyProfileScreen> {
  String? _selectedGender;

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
            25.ph,
            Text(
              "Baby Profile",
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Image.asset("assets/images/baby_and_toy.png"),
                      ),
                    ),
                  ),
                  30.ph,

                  CustomInputField(
                    title: 'Baby Nickname',
                    hint: "your baby's name",
                  ),
                  CustomInputField(
                    title: 'Date of birth',
                    hint: '1/10/1988',
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: SvgPicture.asset(
                        'assets/icons/calender.svg',
                        width: 10,
                        height: 10,
                        colorFilter: const ColorFilter.mode(
                          AppColors.neutralGray,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                  CustomInputField(
                    title: 'Height',
                    hint: '0.0',
                    keyboardType: TextInputType.number,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'cm',
                        style: AppTextStyles.font13Regular.copyWith(
                          color: AppColors.neutralGray,
                        ),
                      ),
                    ),
                  ),
                  5.ph,

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Gender', style: AppTextStyles.font16Medium),
                            8.ph,
                            Row(
                              children: [
                                GenderButton(
                                  gender: 'Girl',
                                  isSelected: _selectedGender == 'girl',
                                  onTap: () {
                                    setState(() {
                                      _selectedGender = 'girl';
                                    });
                                  },
                                ),
                                15.pw,
                                GenderButton(
                                  gender: 'Boy',
                                  isSelected: _selectedGender == 'boy',
                                  onTap: () {
                                    setState(() {
                                      _selectedGender = 'boy';
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [WeightStepperInput()],
                        ),
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 15),
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
          30.ph,
        ],
      ),
    );
  }
}
