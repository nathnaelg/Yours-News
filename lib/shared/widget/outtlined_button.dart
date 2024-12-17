import 'package:flutter/material.dart';
import 'package:yours_news/shared/constant/colors.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final double height;
  final Color tcolor;
  final VoidCallback onPressed;

  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.height,
    required this.tcolor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: IntrinsicWidth(
        child: Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColor.color2ABAFF,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: tcolor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
