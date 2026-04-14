enum RiskLevel {
  low,
  moderate,
  high,
  unknown,
}

///  Convert API string → enum
RiskLevel mapRiskLevel(String risk) {
  final normalized = risk.toLowerCase();

  if (normalized.contains("low")) return RiskLevel.low;
  if (normalized.contains("moderate")) return RiskLevel.moderate;
  if (normalized.contains("high")) return RiskLevel.high;

  return RiskLevel.unknown;
}

///  Description based on enum
String getRiskDescriptionFromEnum(RiskLevel riskLevel) {
  switch (riskLevel) {
    case RiskLevel.low:
      return "Your result indicates minimal depression.";

    case RiskLevel.moderate:
      return "Your result indicates moderate depression. Consider consulting a specialist.";

    case RiskLevel.high:
      return "Your result indicates severe depression. Please seek professional help.";

    case RiskLevel.unknown:
      return "Your result has been recorded.";
  }
}

///  Shortcut: API string → description مباشرة
String getRiskDescription(String risk) {
  final level = mapRiskLevel(risk);
  return getRiskDescriptionFromEnum(level);
}