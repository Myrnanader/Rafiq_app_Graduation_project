import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rafiq_app/core/routing/app_routes.dart';
import 'package:rafiq_app/core/theme/app_texts/app_text_styles.dart';
import 'package:rafiq_app/core/theming/app_colors.dart';

import '../widgets/widgets/custom_post_card.dart';
import '../widgets/widgets/custom_previous_experience_card.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.lightSurface,
      appBar: AppBar(
        backgroundColor: AppColors.lightSurface,
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.neutralGray,
          indicatorColor: AppColors.primary,
          indicatorWeight: 2,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            Tab(child: Text("Posts", style: AppTextStyles.font14SemiBold)),
            Tab(
              child: Text(
                "Previous experience",
                style: AppTextStyles.font14SemiBold,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TabBarView(
          controller: _tabController,
          children: [
            ListView(
              children: [
                CustomPostCard(
                  userName: "Maram Mohammed ",
                  date: "Today , 4:20 Am",
                  description: "Pregnancy yoga is tailored to support the changing needs of your body during each trimester. Gentle stretches....more",
                  userImage: "assets/images/flower.jpg",
                  postImage: "assets/images/yoga.jpg",
                  initialLikes: 30,
                  comments: 12,
                ),
                CustomPostCard(
                  userName: "Sara Ali",
                  date: "yesterday , 5:30 Pm",
                  description: " Eating a variety of fresh vegetables helps provide essential vitamins and strengthens your immune system.",
                  userImage: "assets/images/user2.jpg",
                  postImage: "assets/images/food.png",
                  initialLikes: 90,
                  comments: 20,
                ),
                CustomPostCard(
                  userName: "Mai Adel",
                  date: "3 days ago",
                  description: "Had so much fun today!\nHad so much fun today!\nHad so much fun today!",
                  userImage: "assets/images/mather1.png",
                  postImage: "assets/images/food.png",
                  initialLikes: 150,
                  comments: 30,
                ),
              ],
            ),
            ListView(
              children: [
                CustomPreviousExperienceCard(
                  userName: "Experience 1",
                  date: "Sarah M. 2days ago",
                  description:
                  "After my second child was born, I struggled with severe sleep deprivation. My youngest would wake up every 2 hours, and my toddler was going through a regression phase. I felt exhausted, overwhelmed, and couldn't function properly during the day. My patience was running thin, and I knew something had to change.",
                  userImage: "assets/images/user2.jpg",
                  initialLikes: 123,
                  comments: 18,
                ),
                CustomPreviousExperienceCard(
                  userName: "Experience 2",
                  date: "Mariam M. 5days ago",
                  description: "I experienced feelings of sadness, anxiety, and guilt after giving birth. Simple tasks felt overwhelming, and I isolated myself from friends and family.",
                  userImage: "assets/images/user3.png",
                  initialLikes: 255,
                  comments: 42,
                ),
                CustomPreviousExperienceCard(
                  userName: "Experience 3",
                  date: "Soha M. 1week ago",
                  description: "Managing household tasks, taking care of the newborn, and maintaining work responsibilities left me feeling overwhelmed and exhausted.",
                  userImage: "assets/images/flower.jpg",
                  initialLikes: 188,
                  comments: 31,
                ),
                CustomPreviousExperienceCard(
                  userName: "Experience 4",
                  date: "Sarah M. 2days ago",
                  description: "During my pregnancy, I constantly worried about the health of my baby and potential complications. This stress affected my sleep and mood.",
                  userImage: "assets/images/user.png",
                  initialLikes: 123,
                  comments: 18,
                ),
              ],
            ),
          ],
        ),
      ),

      floatingActionButton: _tabController.index == 0
          ? SizedBox(
              width: 70,
              height: 70,
              child: FloatingActionButton(
                backgroundColor: AppColors.primary,
                shape: CircleBorder(),
                onPressed: () {
                  context.push(AppRoutes.addPostScreen);
                },
                child: const Icon(Icons.add, color: AppColors.lightBackground),
              ),
            )
          : null,
    );
  }
}
