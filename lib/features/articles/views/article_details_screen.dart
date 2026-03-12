import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/helpers/extensions.dart';
import '../../../core/theme/app_texts/app_text_styles.dart';
import '../../../core/theming/app_colors.dart';


class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({super.key});

  // final ArticleItem article;

  // const ArticleDetailsScreen({super.key, required this.article});

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
            5.ph,
            Text(
              "Morning Sickness",
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
            flex: 4,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.lightSurface,
                // boxShadow: const [
                //   BoxShadow(
                //     color: Color(0x33000000),
                //     blurRadius: 30,
                //     offset: Offset(0, 12),
                //   ),
                // ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                child: Image.asset(
                  'assets/images/nausea.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Expanded(
            flex: 6,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   exercise.describe,
                    //   style: AppTextStyles.font20SemiBold.copyWith(
                    //     color: AppColors.onBackgroundLight,
                    //   ),
                    // ),
                    // 10.ph,
                    // Text(
                    //   "Due On ${exercise.dueOn}",
                    //   style: AppTextStyles.font14Medium.copyWith(
                    //     color: AppColors.neutralGray,
                    //   ),
                    // ),
                    // 20.ph,
                    Text(
"Morning sickness is a common experience during early pregnancy, usually appearing in the first trimester due to hormonal changes, increased sensitivity to smells, and changes in digestion. Although it is called “morning” sickness, nausea can occur at any time of the day. Fortunately, several natural strategies can help reduce discomfort and make daily life easier.\n\nOne of the most effective methods is eating small, frequent meals instead of large ones. An empty stomach can worsen nausea, so keeping light snacks such as crackers, toast, or nuts nearby—especially in the morning—can help stabilize blood sugar levels and reduce symptoms. Drinking small amounts of fluids throughout the day rather than large amounts at once can also prevent stomach irritation and dehydration.\n\nGinger is widely known for its natural anti-nausea properties. Drinking ginger tea, adding fresh ginger to meals, or consuming ginger biscuits in moderate amounts may significantly relieve nausea. Similarly, peppermint tea can help relax the digestive system and reduce the feeling of queasiness for some women.\n\nAnother helpful approach is avoiding strong smells and trigger foods, such as greasy, spicy, or heavily fried meals, which can worsen nausea. Choosing simple, bland foods—like rice, bananas, yogurt, and boiled potatoes—often feels easier on the stomach. Getting fresh air and light physical activity, such as a short walk, may also improve digestion and reduce nausea.\n\nFinally, adequate rest and stress reduction play an important role. Fatigue can intensify morning sickness, so maintaining a regular sleep schedule and practicing relaxation techniques like deep breathing can provide additional relief. If nausea becomes severe, persistent, or leads to dehydration, consulting a healthcare professional is important to ensure proper care and treatment.",
                      style: AppTextStyles.font12Regular.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
