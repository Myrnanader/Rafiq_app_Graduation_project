import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:rafiq_app/core/di/di.dart';
import 'package:rafiq_app/core/helpers/functions.dart';
import 'package:rafiq_app/features/auth/presentation/cubit/user_cubit.dart';
import 'package:rafiq_app/features/mother/presentation/cubit/mother_profile_cubit.dart';
import 'package:rafiq_app/features/mother/presentation/cubit/mother_profile_state.dart';

import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/theme/app_texts/app_text_styles.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../core/routing/app_routes.dart';
import '../cubit/mother_profile_photo_cubit.dart';
import '../cubit/mother_profile_photo_state.dart';
import '../widgets/widgets/custom_profile_button.dart';
import '../widgets/widgets/profile_image.dart';
import '../widgets/widgets/profile_info_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<UserCubit>()..getProfile()),
        BlocProvider(create: (_) => getIt<MotherProfileCubit>()..getChildren()),
        BlocProvider(
            create: (_) => getIt<ProfileImageCubit>()..loadImage(),
          ),
      ],

      child: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: AppColors.lightBackground,
            appBar: AppBar(
              backgroundColor: AppColors.lightBackground,
              leading: Column(
                children: [
                  5.ph,
                  IconButton(
                    onPressed: () => GoRouter.of(context).pop(),
                    icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
                  ),
                ],
              ),
              title: Text("My Profile", style: AppTextStyles.font20SemiBold),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  30.ph,
                  BlocBuilder<ProfileImageCubit, ProfileImageState>(
                    builder: (context, state) {
                      String image = 'assets/images/flower2.jpg';

                      if (state is ProfileImageSuccess) {
                        image = state.imageUrl;
                      }

                      return ProfileImage(
                        image: image,
                        onCameraTap: () async {
                          final picker = ImagePicker();

                          final pickedImage = await picker.pickImage(
                            source: ImageSource.gallery,
                          );

                          if (pickedImage != null) {
                            context.read<ProfileImageCubit>().uploadImage(
                              pickedImage.path,
                            );
                          }
                        },
                      );
                    },
                  ),
                  10.ph,

                  /// 👤 name
                  BlocBuilder<UserCubit, UserState>(
                    builder: (context, state) {
                      if (state is UserLoaded) {
                        final profile = state.profile;

                        return Column(
                          children: [
                            Text(
                              profile.fullName,
                              style: AppTextStyles.font16Medium,
                            ),
                            8.ph,
                            Text(
                              "Expecting Mother",
                              style: AppTextStyles.font13Medium,
                            ),
                          ],
                        );
                      }
                      return const SizedBox();
                    },
                  ),

                  20.ph,

                  Row(
                    children: [
                      Expanded(
                        child: CustomProfileButton(
                          svgIconPath: 'assets/icons/plus.svg',
                          text: 'Memories',
                          onPressed: () {
                            context.push(
                              AppRoutes.addMemoryScreen,
                              //   extra: context
                              //       .read<MotherProfileCubit>(), // 🔥
                            );
                          },
                        ),
                      ),
                      10.pw,
                      Expanded(
                        child: CustomProfileButton(
                          svgIconPath: 'assets/icons/plus.svg',
                          text: 'Documents',
                          onPressed: () {
                            context.push(
                              AppRoutes.docsScreen,
                              // extra: context
                              // .read<MotherProfileCubit>(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  20.ph,

                  /// 📊 Age + Month
                  BlocBuilder<UserCubit, UserState>(
                    builder: (context, state) {
                      if (state is UserLoaded) {
                        final profile = state.profile;

                        return Column(
                          children: [
                            ProfileInfoCard(
                              image: "assets/icons/age.svg",
                              title: 'Age',
                              value:
                                  '${calculateAge(profile.dateOfBirth)} years Old',
                            ),
                            const Divider(indent: 20, endIndent: 25),
                            ProfileInfoCard(
                              image: "assets/icons/pregnant_vector.svg",
                              title: 'Current Pregnancy Month',
                              value:
                                  '${calculateMonth(profile.pregnancyWeek)}th Month',
                            ),
                          ],
                        );
                      }
                      return const SizedBox();
                    },
                  ),

                  30.ph,

                  /// 👶 children
                  BlocBuilder<MotherProfileCubit, MotherProfileState>(
                    builder: (context, state) {
                      if (state is ChildrenLoading) {
                        return Center(
                          child: Lottie.asset(
                            "assets/animations/Heart_Loading.json",
                          ),
                        );
                      }

                      if (state is ChildrenLoaded) {
                        if (state.children.isEmpty) {
                          return const Text("No babies yet");
                        }

                        return Column(
                          children: state.children.map((baby) {
                            return ListTile(
                              title: Text(baby.nickname),
                              subtitle: Text(formatDate(baby.dateOfBirth)),
                            );
                          }).toList(),
                        );
                      }

                      return const SizedBox();
                    },
                  ),

                  50.ph,

                  /// 🔘 buttons
                  Row(
                    children: [
                      Expanded(
                        child: CustomProfileButton(
                          svgIconPath: 'assets/icons/plus.svg',
                          text: 'Add Baby',
                          onPressed: () {
                            context.push(
                              AppRoutes.babyProfileScreen,
                              extra: context.read<MotherProfileCubit>(), // 🔥
                            );
                          },
                        ),
                      ),
                      10.pw,
                      Expanded(
                        child: CustomProfileButton(
                          svgIconPath: 'assets/icons/plus.svg',
                          text: 'Add Father\'s Id',
                          onPressed: () {
                            context.push(
                              AppRoutes.addFatherIdScreen,
                              extra: context.read<MotherProfileCubit>(),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
