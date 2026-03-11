import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rafiq_app/features/addMemoryAndDocs/widgets/widgets/upload_file_widget.dart';

import '../../../core/helpers/extensions.dart';
import '../../../core/theme/app_texts/app_text_styles.dart';
import '../../../core/theming/app_colors.dart';
import '../widgets/widgets/custom_doc_card.dart';

class DocsScreen extends StatefulWidget {
  const DocsScreen({super.key});

  @override
  State<DocsScreen> createState() => _DocsScreenState();
}

class _DocsScreenState extends State<DocsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        backgroundColor: AppColors.lightBackground,
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
              "Documents",
              style: AppTextStyles.font20SemiBold.copyWith(
                color: AppColors.onPrimaryFixed,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: [
            30.ph,
            UploadFileWidget(),
            25.ph,
            Text(
              "My documents",
              style: AppTextStyles.font20Regular.copyWith(
                color: AppColors.primary,
              ),
            ),
            10.ph,
            CustomDocCard(
              description:
                  "Full Name of Child - Date of Birth - Time of Birth - Gender - Place of Birth   Father Name - Father Nationality - Mother Name - Mother Nationality",
              title: "Birth Certificate",
              image: "assets/images/birth.jpg",
            ),
            CustomDocCard(
              description:
              "This is the vaccination record of my baby that I uploaded. I wanted to keep everything organized, so I saved a picture of the vaccine he received at the age of 3. He took the Seasonal Influenza Vaccine, which is a [type of vaccine]. Before we went to theclinic, I was a bit nervous like any mom, but the doctor ",
              // "Seasonal Influenza Vaccine - Oral Polio Vaccine - Hepatitis B Vaccine -  Rotavirus Vaccine - Hepatitis A Vaccine - Human Papillomavirus Vaccine",
              title: "Vaccination file",
              image: "assets/images/vaccination-file.jpg",
            ),
            CustomDocCard(
              description:
                  "Neonatal Screening Test - Bilirubin Test - Complete Blood Count - Iron Studies -  Liver Function Tests - Urine Analysis - Kidney Function Tests - Allergy Test",
              title: "Medical tests",
              image: "assets/images/medical-test.jpg",
            ),
            CustomDocCard(
              description:
                  "Full Name of Child - Date of Birth - Time of Birth - Gender - Place of Birth   Father Name - Father Nationality - Mother Name - Mother Nationality",
              title: "Daily health file",
              image: "assets/images/health-file.jpg",
            ),
          ],
        ),
      ),
    );
  }
}
