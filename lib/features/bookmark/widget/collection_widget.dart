import 'package:flutter/material.dart';
import 'package:yours_news/shared/constant/colors.dart';

class CollectionWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const CollectionWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          child: Image.asset(
            imageUrl,
            width: double.infinity,
            height: 110,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                ),
                child: Image.asset(
                  imageUrl,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(10),
                ),
                child: Image.asset(
                  imageUrl,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColor.color1A1A1A,
          ),
        ),
        // const SizedBox(height: 2),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColor.color999999,
          ),
        ),
      ],
    );
  }
}
