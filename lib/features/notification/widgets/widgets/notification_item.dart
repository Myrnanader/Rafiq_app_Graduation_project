import 'package:flutter/cupertino.dart';

class NotificationItem {
  final String title;
  final IconData icon;
  final String date;
  final String description;

  NotificationItem({
    required this.title,
    required this.icon,
    required this.date,
    required this.description,
  });
}
