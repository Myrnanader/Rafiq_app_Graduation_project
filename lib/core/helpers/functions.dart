int calculateAge(String dob) {
  final birthDate = DateTime.parse(dob);
  final today = DateTime.now();

  int age = today.year - birthDate.year;

  if (today.month < birthDate.month ||
      (today.month == birthDate.month &&
          today.day < birthDate.day)) {
    age--;
  }

  return age;
}
int calculateMonth(int week) {
  return (week / 4).ceil();
}
String formatDate(String date) {
  final parsed = DateTime.parse(date);
  return "${parsed.day}/${parsed.month}/${parsed.year}";
}