import 'package:flutter/material.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';

class CaptionContainerWidget extends StatelessWidget {
  const CaptionContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGray,
        border: Border.all(color: AppColors.mediumGray, width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: TextFormField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  hintText: 'Add Caption',
                  hintStyle: TextStyle(
                    color: AppColors.neutralGray,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins'
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: AppColors.onPrimaryFixed, fontSize: 13, fontWeight: FontWeight.w300, fontFamily: 'Poppins'),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Post',
                  style: AppTextStyles.font16Medium.copyWith(
                    color: AppColors.lightBackground,
                  ),
                ),
              ),
            ),
            35.ph,
          ],
        ),
      ),
    );
  }
}
