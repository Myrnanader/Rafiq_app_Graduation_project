abstract class MotherProfileState {}

class MotherProfileInitial extends MotherProfileState {}

class ChildrenLoading extends MotherProfileState {}

class ChildrenLoaded extends MotherProfileState {
  final List<dynamic> children;
  ChildrenLoaded(this.children);
}

class ChildrenError extends MotherProfileState {
  final String message;
  ChildrenError(this.message);
}

class AddBabyLoading extends MotherProfileState {}

class AddBabySuccess extends MotherProfileState {}

class AddBabyError extends MotherProfileState {
  final String message;
  AddBabyError(this.message);
}

class LinkFatherLoading extends MotherProfileState {}

class LinkFatherSuccess extends MotherProfileState {}

class LinkFatherError extends MotherProfileState {
  final String message;
  LinkFatherError(this.message);
}