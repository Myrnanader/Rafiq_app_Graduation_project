import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/common/widgets/app_gradient_background.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import '../../../core/routing/app_routes.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/chat_input_field.dart';

class ChatbotScreen extends StatefulWidget {
  final String? initialMessage;

  const ChatbotScreen({super.key, this.initialMessage});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    super.initState();

    if (widget.initialMessage != null) {
      messages.add({"text": widget.initialMessage, "isBot": false});

      fakeBotReply(widget.initialMessage!);
    }
  }

  void sendMessage() {
    if (controller.text.trim().isEmpty) return;

    final text = controller.text;

    setState(() {
      messages.add({"text": text, "isBot": false});
    });

    controller.clear();

    fakeBotReply(text);
  }

  void fakeBotReply(String text) {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        messages.add({
          // "text": "I understand your question about: $text",
          "text": """
At 6 months, babies usually start solid foods while still continuing breast milk or formula as the main nutrition. The best foods are soft, simple, and easy to digest.

1. Iron-rich foods (very important)
Babies need iron at this age.

- Iron-fortified baby cereal (rice, oat, or barley)
- Mashed lentils
- Pureed chicken or beef
- Mashed beans

2. Vegetables
Cook them well and mash or puree.

- Sweet potato
- Carrot
- Pumpkin
- Zucchini
- Peas

3. Fruits
Soft and mashed.

- Banana
- Avocado
- Apple (steamed then mashed)
- Pear
- Peach

4. Healthy fats
Important for brain development.

- Avocado
- A small amount of olive oil in vegetables

5. Protein foods
Introduce slowly.

- Egg yolk (well cooked)
- Yogurt (plain, full-fat)
- Mashed lentils
""",
          "isBot": true,
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGradientBackground(
        child: Column(
          children: [
            /// HEADER
            Container(
              padding: EdgeInsets.only(
                top: 40.h,
                bottom: 20.h,
                left: 24.w,
                right: 24.w,
              ),
              decoration: BoxDecoration(
                color: AppColors.onPrimary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24.r),
                  bottomRight: Radius.circular(24.r),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.go(AppRoutes.mainNavigationBarScreen);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 20.sp,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Chatbot",
                    style: AppTextStyles.font20SemiBold.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),

            16.h.verticalSpace,

            /// MESSAGES
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return ChatBubble(
                    message: messages[index]["text"],
                    isBot: messages[index]["isBot"],
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(24.0),
              child: ChatInputField(
                controller: controller,
                onSend: sendMessage,
              ),
            ),

            24.h.verticalSpace,
          ],
        ),
      ),
    );
  }
}
