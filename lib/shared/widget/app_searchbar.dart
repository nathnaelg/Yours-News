// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:yours_news/shared/constant/colors.dart';
import 'package:yours_news/shared/widget/secondary_button.dart';
import 'package:yours_news/shared/widget/sort_widget.dart';

final searchQueryProvider = StateProvider<String>((ref) => "");

final selectedDateRangeProvider = StateProvider<String?>((ref) => null);
final selectedCategoriesProvider = StateProvider<List<String>>((ref) => []);
final selectedLocationsProvider = StateProvider<List<String>>((ref) => []);

final selectedFiltersProvider = StateProvider<List<String>>((ref) => []);

const List<String> dateRanges = ['Today', 'This week', 'This month'];
const List<String> categories = [
  'Business',
  'Politics',
  'Lifestyle',
  'Art',
  'Health',
  'Tech',
  'Travel',
  'Fashion',
  'Sports',
  'Food',
  'World',
  'Science',
];
const List<String> locations = [
  'Global',
  'North america',
  'Europe',
  'Asia',
  'Africa',
  'Australia',
  'South america',
];


// this is the custom search box widget that we will use in the search screen


class CustomSearchBox extends StatelessWidget {
  const CustomSearchBox({super.key, required this.hintText});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: AppColor.colorD9EFF9.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(IconsaxPlusLinear.search_normal_1),
            ),
            Text(
              hintText,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: AppColor.color666666,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchScreen extends HookConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(searchQueryProvider);
    final selectedFilters = ref.watch(selectedFiltersProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          decoration: BoxDecoration(
            color: AppColor.colorD9EFF9.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              onChanged: (query) {
                ref.read(searchQueryProvider.notifier).state = query;
              },
              decoration: const InputDecoration(
                icon: Icon(IconsaxPlusLinear.search_normal_1),
                hintText: 'Search “News”',
                border: InputBorder.none,
              ),
              //   ),
              // ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 4.0,
              runSpacing: 4.0,
              children: [
                _buildChip(context, ref, 'This week'),
                _buildChip(context, ref, 'Politics'),
                _buildChip(context, ref, 'Health'),
                _buildChip(context, ref, 'World'),
                _buildChip(context, ref, 'Asia'),
                _buildChip(context, ref, 'South America'),
                ActionChip(
                  backgroundColor: const Color(0xFFE3F6FF),
                  elevation: 0,
                  side: const BorderSide(
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Add Filter",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColor.color2ABAFF,
                    ),
                  ),
                  onPressed: () {
                    _showFilterBottomSheet(context, ref);
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Text(
                  'News',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: AppColor.color121314,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Publishers",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: AppColor.color999999,
                  ),
                )
              ],
            ),
            // const SizedBox(height: 8),
            const Row(
              children: [
                Text(
                  '600 Results found:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColor.color999999,
                  ),
                ),
                Spacer(),
                SortWidget(
                  displayOptions: false,
                )
              ],
            ),

            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  _buildResultCard(
                      title:
                          'Global Summit on Climate Change: Historic Agreement Reached',
                      source: 'BBC News',
                      date: 'Jun 9, 2023',
                      imageUrl: 'assets/png/h1.jpg',
                      logoUrl: "assets/png/bbc.png"),
                  _buildResultCard(
                      title:
                          'Climate Change Impact on Agriculture: Farmers Seek Solutions',
                      source: 'Reuters',
                      date: 'Jun 8, 2023',
                      imageUrl: 'assets/png/h2.jpg',
                      logoUrl: "assets/png/times.png"),
                  // Add more results here...
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(BuildContext context, WidgetRef ref, String label) {
    final selectedCategories = ref.watch(selectedCategoriesProvider);
    final selectedLocations = ref.watch(selectedLocationsProvider);
    final isSelected =
        selectedCategories.contains(label) || selectedLocations.contains(label);

    return FilterChip(
      // shape: const LinearBorder(
      //   side: BorderSide(
      //     color: AppColor.color2ABAFF,
      //     strokeAlign: 2,
      //     style: BorderStyle.solid,
      //     width: 2,
      //   ),
      // ),
      side: BorderSide(
        color: Colors.grey[300]!,
      ),
      backgroundColor: Colors.white,
      label: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
      selected: isSelected,
      onSelected: (selected) {
        if (dateRanges.contains(label)) {
          ref.read(selectedDateRangeProvider.notifier).state =
              selected ? label : null;
        } else if (categories.contains(label)) {
          final updatedCategories = List<String>.from(selectedCategories);
          selected
              ? updatedCategories.add(label)
              : updatedCategories.remove(label);
          ref.read(selectedCategoriesProvider.notifier).state =
              updatedCategories;
        } else if (locations.contains(label)) {
          final updatedLocations = List<String>.from(selectedLocations);
          selected
              ? updatedLocations.add(label)
              : updatedLocations.remove(label);
          ref.read(selectedLocationsProvider.notifier).state = updatedLocations;
        }
      },
    );
  }

  Widget _buildDateRangeOptions(BuildContext context, WidgetRef ref) {
    final selectedDateRange = ref.watch(selectedDateRangeProvider);

    return Column(
      children: dateRanges.map((range) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 0.0),
          child: Row(
            children: [
              Radio<String>(
                activeColor: AppColor.color2ABAFF,
                value: range,
                groupValue: selectedDateRange,
                onChanged: (value) {
                  ref.read(selectedDateRangeProvider.notifier).state = value;
                },
              ),
              Expanded(child: Text(range)),
            ],
          ),
        );
      }).toList(),
    );
  }

  void _showFilterBottomSheet(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Filters',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColor.color1A1A1A,
                ),
              ),
              const Text(
                'Works only for news',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: AppColor.color999999,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Date Range',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              // const SizedBox(height: 8),
              _buildDateRangeOptions(context, ref),
              const SizedBox(height: 6),
              const Text(
                'Category',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColor.color1A1A1A,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 12.0,
                children: categories
                    .map((category) => _buildChip(context, ref, category))
                    .toList(),
              ),
              const SizedBox(height: 6),
              const Text(
                'Location',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColor.color1A1A1A,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 12.0,
                children: locations
                    .map((location) => _buildChip(context, ref, location))
                    .toList(),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SecondaryButton(
                    text: "Reset",
                    onPressed: () {
                      // Reset Filters
                      ref.read(selectedDateRangeProvider.notifier).state = null;
                      ref.read(selectedCategoriesProvider.notifier).state = [];
                      ref.read(selectedLocationsProvider.notifier).state = [];
                    },
                    width: 150,
                    height: 50,
                    tcolor: AppColor.color1A1A1A,
                    bgcolor: AppColor.color121314.withOpacity(0.08),
                  ),
                  SecondaryButton(
                    text: "Done",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    width: 150,
                    height: 50,
                    tcolor: AppColor.white,
                    bgcolor: AppColor.color121314,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _toggleFilter(WidgetRef ref, String filter, bool selected) {
    final filters = List<String>.from(ref.read(selectedFiltersProvider));
    if (selected) {
      filters.add(filter);
    } else {
      filters.remove(filter);
    }
    ref.read(selectedFiltersProvider.notifier).state = filters;
  }

  Widget _buildResultCard({
    required String title,
    required String source,
    required String date,
    required String imageUrl,
    required String logoUrl,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            SizedBox(
              width: 118,
              height: 125,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: AppColor.color1A1A1A,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(3),
                            ),
                            child: Image.asset(logoUrl),
                          ),
                        ),
                        const SizedBox(width: 2),
                        // Expanded(
                        //   child:
                        Text(
                          source,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: AppColor.color999999,
                          ),
                          // ),
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          IconsaxPlusBold.verify,
                          size: 15,
                          color: AppColor.color2ABAFF,
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 8.0,
                          height: 8.0,
                          decoration: const BoxDecoration(
                            color: AppColor.colorEDEDED,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: Text(
                            date,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: AppColor.color999999,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
