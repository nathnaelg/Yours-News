import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:yours_news/shared/constant/colors.dart';

class SortWidget extends StatelessWidget {
  const SortWidget({super.key, this.displayOptions = true});

  final bool displayOptions;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final selectedValue = ref.watch(dropdownProvider) ?? options.first;
        return Row(
          children: [
            const Text(
              "Sort by: ",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: AppColor.color666666,
              ),
            ),
            Container(
              constraints: const BoxConstraints(maxWidth: 100),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: selectedValue,
                  items: options.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                  },
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                  iconSize: 24,
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Icon(IconsaxPlusLinear.arrow_down),
                  ),
                ),
              ),
            ),
            if (displayOptions) ...[
              const Spacer(),
              Transform.rotate(
                angle: 0.25 * 3.14,
                child: const Icon(
                  IconsaxPlusLinear.component,
                  size: 30,
                  color: AppColor.color2ABAFF,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              const Icon(IconsaxPlusLinear.row_vertical)
            ],
            // const Spacer(),
            // Transform.rotate(
            //   angle: 0.25 * 3.14,
            //   child: const Icon(
            //     IconsaxPlusLinear.component,
            //     size: 30,
            //     color: AppColor.color2ABAFF,
            //   ),

            // ),
            // const SizedBox(
            //   width: 5,
            // ),
            // const Icon(IconsaxPlusLinear.row_vertical)
          ],
        );
      },
    );
  }
}

final dropdownProvider = StateProvider<String?>((ref) => null);

final List<String> options = ['Newest', 'Oldest', 'Popular'];
