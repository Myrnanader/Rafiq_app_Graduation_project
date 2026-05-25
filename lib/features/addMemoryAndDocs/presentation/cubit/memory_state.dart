part of 'memory_cubit.dart';

abstract class MemoriesState {}

class MemoriesInitial extends MemoriesState {}

class MemoriesLoading extends MemoriesState {}

class MemoriesSuccess extends MemoriesState {
  final List<MemoryModel> memories;

  MemoriesSuccess(this.memories);
}

class UploadMemorySuccess extends MemoriesState {}

class DeleteMemorySuccess extends MemoriesState {}

class MemoriesError extends MemoriesState {
  final String message;

  MemoriesError(this.message);
}
