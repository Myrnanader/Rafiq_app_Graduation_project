import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq_app/core/common/widgets/date_of_birth_feild.dart';
import 'package:rafiq_app/core/di/di.dart';
import 'package:rafiq_app/features/mother/data/models/add_baby_request.dart';
import 'package:rafiq_app/features/mother/presentation/cubit/mother_profile_cubit.dart';
import 'package:rafiq_app/features/mother/presentation/cubit/mother_profile_state.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../widgets/widgets/custom_gender_button.dart';
import '../widgets/widgets/custom_input_field.dart';
import 'weight_input.dart';

class BabyProfileScreen extends StatefulWidget {
  const BabyProfileScreen({super.key});

  @override
  BabyProfileScreenState createState() => BabyProfileScreenState();
}

class BabyProfileScreenState extends State<BabyProfileScreen> {
  String? _selectedGender;
  int weight = 0;
  final nicknameController = TextEditingController();
  final heightController = TextEditingController();
  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<MotherProfileCubit, MotherProfileState>(
      listener: (context, state) {
        if (state is AddBabySuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Baby added successfully")),
          );
          context.pop();
        }
    
        if (state is AddBabyError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
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
                          child: Image.asset(
                            "assets/images/baby_and_toy.png",
                          ),
                        ),
                      ),
                    ),
                    30.ph,
    
                    CustomInputField(
                      title: 'Baby Nickname',
                      hint: "your baby's name",
                      controller: nicknameController,
                    ),
    
                    ///  استخدمنا widget بتاعتك بدون تغيير UI
                    DateOfBirthField(controller: dateController),
    
                    20.ph,
    
                    CustomInputField(
                      title: 'Height',
                      hint: '0.0',
                      keyboardType: TextInputType.number,
                      controller: heightController,
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
                              Text(
                                'Gender',
                                style: AppTextStyles.font16Medium,
                              ),
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
                            children: [
                              WeightStepperInput(
                                onChanged: (val) {
                                  weight = val;
                                },
                              ),
                            ],
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
                  onPressed: () {
                    ///  validation بسيطة
                    if (dateController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please select date")),
                      );
                      return;
                    }
    
                    context.read<MotherProfileCubit>().addBaby(
                      AddBabyRequest(
                        nickname: nicknameController.text,
                        dateOfBirth: dateController.text,
                        height: double.tryParse(heightController.text) ?? 0,
                        weight: weight.toDouble(), 
                        gender: _selectedGender == 'girl' ? 0 : 1,
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
      ),
    );
  }
}
