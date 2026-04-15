class VaccineItem {
  final String id;
  final String name;
  final String dueOn;
  final String schedule;
  final bool isPending; //  غيرناها من isDue

  VaccineItem(
    this.id,
    this.name,
    this.dueOn,
    this.schedule,
    this.isPending,
  );
}