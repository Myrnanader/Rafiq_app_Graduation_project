part of 'cry_cubit.dart';

abstract class CryState {
  const CryState();
}

class CryInitial extends CryState {
  const CryInitial();
}

class CryRecording extends CryState {
  final int seconds;

  const CryRecording({
    required this.seconds,
  });
}

class CryUploading extends CryState {
  const CryUploading();
}

class CrySuccess extends CryState {
  final CryAnalysisResult result;

  const CrySuccess(this.result);
}

class CryError extends CryState {
  final String message;

  const CryError(this.message);
}
