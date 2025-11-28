import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';

class CustomGridviewWidget extends StatefulWidget {
  final List<Map<String, dynamic>> items;

  const CustomGridviewWidget({super.key, required this.items});

  @override
  State<CustomGridviewWidget> createState() => _CustomGridviewWidgetState();
}

class _CustomGridviewWidgetState extends State<CustomGridviewWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 1.1,
      ),
      itemCount: widget.items.length,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          color: AppColors.lightBackground,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5.0,
              spreadRadius: 0.1,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              widget.items[index]["icon"] as String,
              width: 50,
              height: 50,
              colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
            ),
            10.ph,
            Text(
              widget.items[index]["label"]!.toString(),
              textAlign: TextAlign.center,
              style: AppTextStyles.font14Regular,
            ),
          ],
        ),
      ),
    );
  }
}
