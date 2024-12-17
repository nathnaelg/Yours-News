import 'package:flutter/material.dart';
import 'package:yours_news/shared/constant/colors.dart';

class ProfileStats extends StatelessWidget {
  final String title;
  final int count;

  const ProfileStats({super.key, required this.title, required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$count',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: AppColor.color666666),
        ),
      ],
    );
  }
}
