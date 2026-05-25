import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_manager/photo_manager.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../core/theming/app_colors.dart';
import '../widgets/widgets/add_photo_widget.dart';
import '../widgets/widgets/caption_container_widget.dart';
import '../widgets/widgets/image_row_widget.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  List<String> imagePaths = [];
  TextEditingController contentController = TextEditingController();


  Future<void> _openImagePicker() async {
    final result = await showModalBottomSheet<List<AssetEntity>>(
      context: context,
      isScrollControlled: true,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: const AddPhoto(),
      ),
    );

    if (result != null) {
      List<String> paths = [];
      for (var asset in result) {
        final file = await asset.file;
        if (file != null) paths.add(file.path);
      }

      setState(() => imagePaths = paths);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightSurface,
      appBar: AppBar(
        backgroundColor: AppColors.lightSurface,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              5.ph,
              IconButton(
                onPressed: () => context.pop(),
                icon: SvgPicture.asset(
                  "assets/icons/close.svg",
                  width: 18,
                  height: 18,
                  colorFilter: ColorFilter.mode(
                    AppColors.onPrimaryFixed,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ),
        title: Column(
          children: [
            5.ph,
            Text(
              "New Post",
              style: AppTextStyles.font20SemiBold.copyWith(
                color: AppColors.onPrimaryFixed,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _openImagePicker(),
            icon: SvgPicture.asset(
              "assets/icons/solar_camera-linear.svg",
              width: 30,
              height: 30,
              colorFilter: ColorFilter.mode(
                AppColors.onPrimaryFixed,
                BlendMode.srcIn,
              ),
            ),
          ),
          10.pw,
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 350,
            child: ImageRowWidget(
              imagePaths: imagePaths,
              onRemove: (index) {
                setState(() => imagePaths.removeAt(index));
              },
            ),
          ),
          Expanded(
            child: CaptionContainerWidget(
              imagePaths: imagePaths,
            ),
          ),
        ],
      ),
    );
  }
}
