import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../cubit/mother_posts_cubit.dart';

class CaptionContainerWidget extends StatefulWidget {
  final List<String> imagePaths;

  const CaptionContainerWidget({super.key, required this.imagePaths});

  @override
  State<CaptionContainerWidget> createState() => _CaptionContainerWidgetState();
}

class _CaptionContainerWidgetState extends State<CaptionContainerWidget> {
  final TextEditingController controller = TextEditingController();

  bool isLoading = false;

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
            /// 🟢 Caption input
            Expanded(
              child: TextFormField(
                controller: controller,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: 'Add Caption',
                  border: InputBorder.none,
                ),
              ),
            ),

            /// 🟢 Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () async {
                  final content = controller.text.trim();
                  if (content.isEmpty) return;

                  setState(() => isLoading = true);

                  final postsCubit = context.read<PostsCubit>();
                  final navigator = Navigator.of(context);

                  await postsCubit.createPost(
                    content: content,
                    imagePath: widget.imagePaths.isNotEmpty
                        ? widget.imagePaths.first
                        : null,
                  );

                  if (!mounted) return;

                  setState(() => isLoading = false);

                  navigator.pop();
                },


                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : Text(
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
