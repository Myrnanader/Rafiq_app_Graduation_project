abstract class ProfileImageState {}

class ProfileImageInitial
    extends ProfileImageState {}

class ProfileImageLoading
    extends ProfileImageState {}

class ProfileImageSuccess
    extends ProfileImageState {
  final String imageUrl;

  ProfileImageSuccess(this.imageUrl);
}

class ProfileImageDeleted
    extends ProfileImageState {}

class ProfileImageError
    extends ProfileImageState {
  final String message;

  ProfileImageError(this.message);
}