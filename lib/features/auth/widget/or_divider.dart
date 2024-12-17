import 'package:flutter/material.dart';
import 'package:yours_news/shared/constant/colors.dart';

class ORDivider extends StatelessWidget {
  final EdgeInsetsGeometry padding;

  const ORDivider({
    super.key,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: AppColor.colorEDEDED,
              height: 1,
            ),
          ),
          const SizedBox(width: 8.0),
          const Text(
            "or",
            style: TextStyle(
              fontSize: 16.0,
              color: AppColor.textColor ,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Container(
              color: AppColor.colorEDEDED,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
