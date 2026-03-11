import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';
import '../../../../core/helpers/extensions.dart';
import '../../views/video_details_screen.dart';

class CustomVideoCard extends StatefulWidget {
  final String title;
  final String description;
  final String videoPath;

  const CustomVideoCard({
    super.key,
    required this.title,
    required this.description,
    required this.videoPath,
  });

  @override
  State<CustomVideoCard> createState() => _CustomVideoCardState();
}

class _CustomVideoCardState extends State<CustomVideoCard> {
  bool isSaved = false;
  late YoutubePlayerController _ytController;

  @override
  void initState() {
    super.initState();

    _ytController = YoutubePlayerController(
      initialVideoId:
      YoutubePlayer.convertUrlToId(widget.videoPath)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        showLiveFullscreenButton: false,
      ),
    );
  }

  @override
  void dispose() {
    _ytController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (_) =>  VideoDetailsScreen(),
        //   ),
        // );
      },
      child: Card(
        shadowColor: const Color(0x50000000),
        elevation: 8,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        color: AppColors.lightBackground,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// YOUTUBE VIDEO
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: YoutubePlayer(
                  controller: _ytController,
                  showVideoProgressIndicator: true,
                ),
              ),

              12.ph,

              Text(
                widget.title,
                style: AppTextStyles.font14Medium.copyWith(
                  color: AppColors.onBackgroundLight,
                ),
              ),

              12.ph,

              Text(
                widget.description,
                style: AppTextStyles.font11Regular.copyWith(
                  color: AppColors.grey,
                ),
              ),

              12.ph,

              Row(
                children: [
                  Text(
                    isSaved ? "SAVED FOR LATER" : "SAVE FOR LATER",
                    style: AppTextStyles.font12Medium.copyWith(
                      color: isSaved
                          ? AppColors.primary
                          : AppColors.neutralGray,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSaved = !isSaved;
                      });
                    },
                    child: Icon(
                      isSaved
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                      color: isSaved
                          ? AppColors.primary
                          : AppColors.neutralGray,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
