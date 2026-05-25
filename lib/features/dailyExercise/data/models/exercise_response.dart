import 'package:json_annotation/json_annotation.dart';

part 'exercise_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ExerciseResponse<T> {

  final String status;
  final String? message;
  final T data;

  ExerciseResponse({
    required this.status,
    this.message,
    required this.data,
  });

  factory ExerciseResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) =>
      _$ExerciseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(
      Object? Function(T value) toJsonT,
      ) =>
      _$ExerciseResponseToJson(this, toJsonT);
}
