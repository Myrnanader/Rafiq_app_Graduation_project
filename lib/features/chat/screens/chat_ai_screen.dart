import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import '../widgets/topic_card.dart';
import '../widgets/chat_input_field.dart';

class ChatAiScreen extends StatelessWidget {
  const ChatAiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: AppGradientBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                40.h.verticalSpace,

                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      context.push(AppRoutes.dashboardScreen);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 20.sp,
                      color: Colors.black,
                    ),
                  ),
                ),

                20.h.verticalSpace,

                Text(
                  "Hi, Sara !",
                  style: AppTextStyles.font20SemiBold.copyWith(
                    color: AppColors.onPrimary,
                  ),
                ),

                6.h.verticalSpace,

                Text(
                  "How Can I Help You Today ?",
                  style: AppTextStyles.font20SemiBold.copyWith(
                    color: AppColors.onPrimary,
                  ),
                ),

                24.h.verticalSpace,

                Image.asset(
                  "assets/images/Chatbot.png",
                  width: 156.w,
                  height: 156.h,
                ),

                28.h.verticalSpace,

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Popular Topics",
                    style: AppTextStyles.font20SemiBold.copyWith(
                      color: AppColors.onPrimary,
                    ),
                  ),
                ),

                16.h.verticalSpace,

                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                  childAspectRatio: 1.3,
                  children: [
                    TopicCard(
                      text: "My baby has a \nfever, what \nshould i do?",
                      onTap: () {
                        context.pushNamed(
                          AppRoutes.chatbotScreen,
                          extra: "My baby has a fever, what should i do?",
                        );
                      },
                    ),
                    TopicCard(
                      text: "How much sleep \ndoes my baby \nneed",
                      onTap: () {
                        context.pushNamed(
                          AppRoutes.chatbotScreen,
                          extra: "How much sleep does my baby need",
                        );
                      },
                    ),
                    TopicCard(
                      text: "Best foods for \n6-month-old baby",
                      onTap: () {
                        context.pushNamed(
                          AppRoutes.chatbotScreen,
                          extra: "Best foods for 6-month-old baby",
                        );
                      },
                    ),
                    TopicCard(
                      text: "Give me tips for \nmy baby's \ngrowth",
                      onTap: () {
                        context.pushNamed(
                          AppRoutes.chatbotScreen,
                          extra: "Give me tips for my baby's growth",
                        );
                      },
                    ),
                  ],
                ),

                30.h.verticalSpace,

                ChatInputField(
                  controller: TextEditingController(),
                  onSend: () {
                    context.pushNamed(AppRoutes.chatbotScreen);
                  },
                ),

                32.h.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
