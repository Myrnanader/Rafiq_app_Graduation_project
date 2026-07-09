/// Request body sent to `POST /predict-delivery`.
///
/// The Cubit keeps answers in a `List<double?> features` ordered as:
/// 0  -> fetal_compromise
/// 1  -> previous_uterine_surgery
/// 2  -> no_of_previous_csections
/// 3  -> twins_or_more
/// 4  -> height
/// 5  -> parity
/// 6  -> gestation
/// 7  -> multiple_pregnancy
/// 8  -> antepartum_haemorrhage
/// 9  -> pre_eclampsia
/// 10 -> systolic_blood_pressure
/// 11 -> diastolic_blood_pressure
///
class DeliveryPredictionRequest {
  const DeliveryPredictionRequest({
    required this.fetalCompromise,
    required this.previousUterineSurgery,
    required this.noOfPreviousCsections,
    required this.twinsOrMore,
    required this.height,
    required this.parity,
    required this.gestation,
    required this.multiplePregnancy,
    required this.antepartumHaemorrhage,
    required this.preEclampsia,
    required this.systolicBloodPressure,
    required this.diastolicBloodPressure,
  });


  factory DeliveryPredictionRequest.fromFeatures(List<double?> features) {
    assert(features.length == 12, 'Expected exactly 12 features');
    return DeliveryPredictionRequest(
      fetalCompromise: features[0]!,
      previousUterineSurgery: features[1]!,
      noOfPreviousCsections: features[2]!,
      twinsOrMore: features[3]!,
      height: features[4]!,
      parity: features[5]!,
      gestation: features[6]!,
      multiplePregnancy: features[7]!,
      antepartumHaemorrhage: features[8]!,
      preEclampsia: features[9]!,
      systolicBloodPressure: features[10]!,
      diastolicBloodPressure: features[11]!,
    );
  }

  final double fetalCompromise;
  final double previousUterineSurgery;
  final double noOfPreviousCsections;
  final double twinsOrMore;
  final double height;
  final double parity;
  final double gestation;
  final double multiplePregnancy;
  final double antepartumHaemorrhage;
  final double preEclampsia;
  final double systolicBloodPressure;
  final double diastolicBloodPressure;

  Map<String, dynamic> toJson() {
    return {
      'PrimaryIndicationforCaesarean_fetal_compromise': fetalCompromise,
      'PrimaryIndicationforCaesarean_previous_uterine_surgery':
      previousUterineSurgery,
      'No_Of_previous_Csections': noOfPreviousCsections,
      'Risk_Factors_twins_or_more': twinsOrMore,
      'Height': height,
      'Parity': parity,
      'Gestation': gestation,
      'PrimaryIndicationforCaesarean_multiple_pregnancy': multiplePregnancy,
      'PrimaryIndicationforCaesarean_antepartum_haemorrhage':
      antepartumHaemorrhage,
      'PrimaryIndicationforCaesarean_pre_eclampsia': preEclampsia,
      'SystolicBloodPressureCuff': systolicBloodPressure,
      'DiastolicBloodPressure': diastolicBloodPressure,
    };
  }
}