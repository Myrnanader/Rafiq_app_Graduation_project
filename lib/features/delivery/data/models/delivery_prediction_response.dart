/// Response returned by `POST /predict-delivery`.
///
/// ```json
/// {
///   "prediction": "C-Section",
///   "c_section_probability": 0.9921252227790489,
///   "calculated_MAP": 93.33333333333333
/// }
/// ```
class DeliveryPredictionResponse {
  const DeliveryPredictionResponse({
    required this.prediction,
    required this.cSectionProbability,
    required this.calculatedMap,
  });

  factory DeliveryPredictionResponse.fromJson(Map<String, dynamic> json) {
    return DeliveryPredictionResponse(
      prediction: json['prediction'] as String,
      cSectionProbability: (json['c_section_probability'] as num).toDouble(),
      calculatedMap: (json['calculated_MAP'] as num).toDouble(),
    );
  }

  final String prediction;

  final double cSectionProbability;
  final double calculatedMap;

  bool get isCSection =>
      prediction.toLowerCase().replaceAll('-', '').replaceAll(' ', '') ==
      'csection';
}
