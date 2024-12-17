import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yours_news/shared/constant/colors.dart';

enum FilterOption { all, recommended, popular, mostvisited, trending }

final filterProvider = StateProvider<FilterOption>((ref) => FilterOption.all);

class FilterWidget extends ConsumerWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFilter = ref.watch(filterProvider);

    return SizedBox(
      height: 35,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: FilterOption.values.map((option) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                ref.read(filterProvider.notifier).state = option;
              },
              child: FilterItem(
                text: _filterOptionToString(option),
                isActive: currentFilter == option,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  String _filterOptionToString(FilterOption option) {
    switch (option) {
      case FilterOption.all:
        return 'All';
      case FilterOption.recommended:
        return 'Recommended';
      case FilterOption.popular:
        return 'Popular';
      case FilterOption.mostvisited:
        return 'Most Visited';
      case FilterOption.trending:
        return 'Trending';
    }
  }
}

class FilterItem extends StatelessWidget {
  final String text;
  final bool isActive;

  const FilterItem({super.key, 
    required this.text,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: isActive ? AppColor.color2ABAFF : AppColor.color666666,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
        if (isActive)
          Container(
            width: 8.0,
            height: 8.0,
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
          ),
      ],
    );
  }
}
