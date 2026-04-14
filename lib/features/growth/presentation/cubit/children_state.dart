part of 'children_cubit.dart';

abstract class ChildrenState {}

class ChildrenInitial extends ChildrenState {}

class ChildrenLoading extends ChildrenState {}

class ChildrenSuccess extends ChildrenState {
  final List<ChildResponse> children;

  ChildrenSuccess(this.children);
}

class ChildrenError extends ChildrenState {
  final String message;

  ChildrenError(this.message);
}