import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:yours_news/features/bookmark/widget/collection_widget.dart';
import 'package:yours_news/shared/constant/colors.dart';
import 'package:yours_news/shared/widget/app_searchbar.dart';
import 'package:yours_news/shared/widget/custom_appbar.dart';

class BookmarkScreen extends ConsumerWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionItems = [
      {
        'imageUrl': 'assets/png/h1.jpg',
        'title': 'Business',
        'subtitle': '3 News',
      },
      {
        'imageUrl': 'assets/png/h2.jpg',
        'title': 'Sport',
        'subtitle': '5 News',
      },
    ];
    return Scaffold(
      appBar: CustomAppBar(
        title: "Bookmarks",
        actions: [
          Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle,
              border: Border.all(
                width: 1,
                color: AppColor.colorEDEDED,
              ),
            ),
            child: GestureDetector(
              onTap: () {},
              child: Transform.rotate(
                angle: 0.5 * 3.14,
                child: const Icon(
                  IconsaxPlusLinear.more,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Personal collection of noteworthy reads",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColor.color999999),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchScreen()),
                );
              },
              child: const CustomSearchBox(
                hintText: "Search “Collection”",
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  childAspectRatio: 0.5,
                  mainAxisSpacing: 86.0,
                ),
                itemCount: collectionItems.length,
                itemBuilder: (context, index) {
                  final item = collectionItems[index];
                  return CollectionWidget(
                    imageUrl: item['imageUrl']!,
                    title: item['title']!,
                    subtitle: item['subtitle']!,
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
