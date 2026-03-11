import 'package:flutter/material.dart';
import 'package:rafiq_app/features/vaccinations/widgets/widgets/vaccine_item.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';
import '../../views/vaccine_details_screen.dart';

class VaccineCard extends StatelessWidget {
  final VaccineItem vaccine;

  const VaccineCard({super.key, required this.vaccine});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      elevation: 0,
      color: AppColors.lightBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: AppColors.lightBackground),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        title: Text(
          vaccine.name,
          style: AppTextStyles.font14Medium.copyWith(color: AppColors.onBackgroundLight),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            4.ph,
            Row(
              children: [
                Text(
                  "Due On ",
                  style: AppTextStyles.font12Medium.copyWith(color: AppColors.neutralGray),
                ),
                Text(
                  vaccine.dueOn,
                  style: AppTextStyles.font12Medium.copyWith(color: AppColors.onBackgroundLight),
                ),
              ],
            ),
            20.ph,
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                side: BorderSide(color: AppColors.primary),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              ),
              child: Text(
                "Mark Token",
                style: AppTextStyles.font11Regular.copyWith(color: AppColors.primary),
              ),
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.primary),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => VaccineDetailsScreen(vaccine: vaccine),
            ),
          );
        },
      ),
    );
  }
}
