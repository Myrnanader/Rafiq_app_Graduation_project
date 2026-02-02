import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/helpers/extensions.dart';
import '../../../core/theme/app_texts/app_text_styles.dart';
import '../../../core/theming/app_colors.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightBackground,
        leading: Column(
          children: [
            5.ph,
            IconButton(
              onPressed: () => GoRouter.of(context).pop(),
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
              "Edit Profile",
              style: AppTextStyles.font20SemiBold.copyWith(
                color: AppColors.onPrimaryFixed,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),

            _buildTextField(label: 'Full Name', initialValue: 'Maram Mohammed'),
            const SizedBox(height: 20),

            // حقل البريد الإلكتروني
            _buildTextField(
              label: 'Email',
              initialValue: 'maram@gmail.com',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),

            // حقل تاريخ الميلاد
            _buildTextField(
              label: 'Date of birth',
              initialValue: '6/10/1988',
              isDate: true,
              onTap: () {
                // منطق عرض منتقي التاريخ (DatePicker)
                print("Show Date Picker");
              },
            ),
            const SizedBox(height: 50),

            // زر حفظ التغييرات
            ElevatedButton(
              onPressed: () {
                // منطق حفظ البيانات
                print("Changes Saved!");
                Navigator.pop(context);
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String initialValue,
    TextInputType keyboardType = TextInputType.text,
    bool isDate = false,
    VoidCallback? onTap,
  }) {
    return TextFormField(
      initialValue: initialValue,
      readOnly: isDate, // لجعل حقل التاريخ للقراءة فقط وتشغيل onTap
      keyboardType: keyboardType,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        // أيقونة التقويم لحقل التاريخ
        suffixIcon: isDate ? const Icon(Icons.calendar_month_outlined) : null,
      ),
    );
  }
}
