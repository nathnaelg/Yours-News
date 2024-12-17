import 'package:flutter/widgets.dart';

class CardItem {
  final String imageUrl;
  final String title;
  final String logoUrl;
  final String text;
  final IconData icon;
  final String date;
  final String tag;

  CardItem({
    required this.imageUrl,
    required this.title,
    required this.logoUrl,
    required this.text,
    required this.icon,
    required this.date,
    required this.tag,
  });
}
