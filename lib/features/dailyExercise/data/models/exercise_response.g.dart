// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExerciseResponse<T> _$ExerciseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => ExerciseResponse<T>(
  status: json['status'] as String,
  message: json['message'] as String?,
  data: fromJsonT(json['data']),
);

Map<String, dynamic> _$ExerciseResponseToJson<T>(
  ExerciseResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': toJsonT(instance.data),
};
