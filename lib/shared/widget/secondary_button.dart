import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Color tcolor;
  final Color bgcolor;
  final VoidCallback onPressed;
  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.tcolor,
    required this.bgcolor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: bgcolor, borderRadius: BorderRadius.circular(7)),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: tcolor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ));
  }
}
