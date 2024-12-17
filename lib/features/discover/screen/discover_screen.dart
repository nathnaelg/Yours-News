import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:yours_news/features/discover/widget/filter_widget.dart';
import 'package:yours_news/features/discover/widget/publisher_tile.dart';
import 'package:yours_news/features/home/provider/news_provider.dart';
import 'package:yours_news/features/home/widget/news_card2.dart';
import 'package:yours_news/shared/constant/colors.dart';
import 'package:yours_news/shared/widget/app_searchbar.dart';
import 'package:yours_news/shared/widget/custom_appbar.dart';

class DiscoverScreen extends HookConsumerWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardItems = ref.watch(cardListProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: "Discover",
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
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Uncover a world of captivating stories and stay informed",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: AppColor.color999999,
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SearchScreen()),
                    );
                  },
                  child: const CustomSearchBox(
                    hintText: "Search “News”",
                  ),
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Text(
                      "Publishers",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColor.color1A1A1A,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColor.color999999,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 180,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    // shrinkWrap: true,
                    children: const [
                      PublisherTile(
                        logoUrl: 'assets/png/forbes.png',
                        publisherName: 'Forbes',
                      ),
                      PublisherTile(
                        logoUrl: 'assets/png/fox.png',
                        publisherName: 'Fox News',
                      ),
                      PublisherTile(
                        logoUrl: 'assets/png/abc.png',
                        publisherName: 'ABC News',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "News",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColor.color1A1A1A,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(
                  child: FilterWidget(),
                ),
                const SizedBox(
                  height: 16,
                ),
                Column(
                  children: List.generate(cardItems.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: NewsCard2(item: cardItems[index]),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


