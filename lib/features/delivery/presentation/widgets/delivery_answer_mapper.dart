/// Converts a "Yes"/"No" dropdown selection into the double the API
/// expects (1.0 / 0.0). Returns null if nothing was selected yet.
double? yesNoToDouble(String? value) {
  if (value == null) return null;
  return value == 'Yes' ? 1.0 : 0.0;
}

/// Converts a stored double back into "Yes"/"No" so a dropdown can be
/// pre-filled when the user navigates back to a step they already
/// answered.
String? yesNoLabel(double? value) {
  if (value == null) return null;
  return value == 1.0 ? 'Yes' : 'No';
}
