extension DateFormatHelper on String {
  String toFormattedDate() {
    final date = DateTime.parse(this);
    return "${date.day}/${date.month}/${date.year}";
  }

  String toTimeAgo() {
    final date = DateTime.parse(this);
    final now = DateTime.now();
    final diff = now.difference(date);

    if (diff.inMinutes < 1) return "Just now";
    if (diff.inMinutes < 60) return "${diff.inMinutes} min ago";
    if (diff.inHours < 24) return "${diff.inHours} h ago";
    if (diff.inDays < 7) return "${diff.inDays} days ago";

    return toFormattedDate();
  }
}
