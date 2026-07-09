double? yesNoToDouble(String? value) {
  if (value == null) return null;
  return value == 'Yes' ? 1.0 : 0.0;
}

String? yesNoLabel(double? value) {
  if (value == null) return null;
  return value == 1.0 ? 'Yes' : 'No';
}
