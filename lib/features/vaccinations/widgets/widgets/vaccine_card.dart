import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/features/vaccinations/widgets/widgets/vaccine_item.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';
import '../../views/vaccine_details_screen.dart';

class VaccineCard extends StatefulWidget {
  final VaccineItem vaccine;

  const VaccineCard({super.key, required this.vaccine});

  @override
  State<VaccineCard> createState() => _VaccineCardState();
}

class _VaccineCardState extends State<VaccineCard> {
  bool marked = false;

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
          widget.vaccine.name,
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
                  widget.vaccine.dueOn,
                  style: AppTextStyles.font12Medium.copyWith(color: AppColors.onBackgroundLight),
                ),
              ],
            ),
            8.ph,
            Row(
              children: [
                Text(
                  "Scheduled Date ",
                  style: AppTextStyles.font12Medium.copyWith(color: AppColors.neutralGray),
                ),
                Text(
                  widget.vaccine.scedule,
                  style: AppTextStyles.font12Medium.copyWith(color: AppColors.onBackgroundLight),
                ),
              ],
            ),
            18.ph,
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      marked = !marked;
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                backgroundColor: marked? AppColors.primary : AppColors.lightBackground,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    side: BorderSide(color: AppColors.primary),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(
                    marked? "Marked Token": "Mark Token",
                    style: AppTextStyles.font11Regular.copyWith(color: marked? AppColors.lightBackground : AppColors.primary),
                  ),
                ),
            5.pw,
            OutlinedButton(
              onPressed: () {
                context.go(AppRoutes.vaccineScheduleName);
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                side: BorderSide(color: AppColors.primary),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: Text(
                "Schedule Vaccination",
                style: AppTextStyles.font11Regular.copyWith(color: AppColors.lightBackground),
              ),
            ),
              ],
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.primary),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => VaccineDetailsScreen(vaccine: widget.vaccine),
            ),
          );
        },
      ),
    );
  }
}
