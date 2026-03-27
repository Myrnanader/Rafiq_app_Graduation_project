part of 'cry_cubit.dart';

abstract class CryState {}

/// الحالة الابتدائية - جاهز للتسجيل
class CryInitial extends CryState {}

/// بيسجل دلوقتي
class CryRecording extends CryState {
  /// مدة التسجيل بالثواني
  final int seconds;
  CryRecording({this.seconds = 0});
}

/// بيرفع الملف للـ API
class CryUploading extends CryState {}

/// النتيجة جات بنجاح
class CrySuccess extends CryState {
  final CryAnalysisResult result;
  CrySuccess(this.result);
}

/// حصل خطأ
class CryError extends CryState {
  final String message;
  CryError(this.message);
}