import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/mother_profile_photo_repository.dart';
import 'mother_profile_photo_state.dart';

class ProfileImageCubit
    extends Cubit<ProfileImageState> {

  final MotherProfilePhotoRepository repo;

  ProfileImageCubit(this.repo)
      : super(ProfileImageInitial());

  Future<void> uploadImage(String imagePath) async {
    emit(ProfileImageLoading());

    try {
      final imageUrl = await repo.uploadProfileImage(imagePath);

      final fullUrl = imageUrl.startsWith('http')
          ? imageUrl
          : "https://rafiq.runasp.net/api/$imageUrl";

      emit(
        ProfileImageSuccess(fullUrl),
      );
    } catch (e) {
      emit(
        ProfileImageError(
          "Failed to upload image",
        ),
      );
    }
  }

  Future<void> deleteImage() async {
    try {
      await repo.deleteProfileImage();

      emit(ProfileImageDeleted());
    } catch (e) {
      emit(
        ProfileImageError(
          "Failed to delete image",
        ),
      );
    }
  }

  Future<void> loadImage() async {
    try {
      final imageUrl =
      await repo.getProfileImage();

      if (imageUrl != null) {
        emit(
          ProfileImageSuccess(imageUrl),
        );
      }
    } catch (e) {
      emit(
        ProfileImageError(
          "Failed to load image",
        ),
      );
    }
  }
}