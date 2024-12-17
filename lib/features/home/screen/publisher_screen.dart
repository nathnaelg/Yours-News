import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:yours_news/features/home/provider/news_provider.dart';
import 'package:yours_news/features/home/widget/news_card2.dart';
import 'package:yours_news/shared/widget/profile_info.dart';
import 'package:yours_news/shared/constant/colors.dart';
import 'package:yours_news/shared/widget/app_searchbar.dart';
import 'package:yours_news/shared/widget/custom_appbar.dart';
import 'package:yours_news/shared/widget/sort_widget.dart';

class PublisherScreen extends HookConsumerWidget {
  const PublisherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardItems = ref.watch(cardListProvider);

    return Scaffold(
      appBar: const CustomAppBar(
        automaticallyImplyLeading: true,
      ),
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const ProfileInfo(
                  image: "assets/png/forbes.png",
                  isPersonalProfile: false,
                  news: 10,
                  followers: 100,
                  following: 200,
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const Text(
                      "Forbes",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: AppColor.color1A1A1A),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Icon(
                      IconsaxPlusBold.verify,
                      color: Colors.blue[400],
                    )
                  ],
                ),
                const Text(
                  "Empowering your business journey with expert insights and influential perspectives.",
                  maxLines: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: AppColor.color666666,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "News by Forbes",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: AppColor.color1A1A1A,
                  ),
                ),
                // const SizedBox(
                //   height: 1.0,
                // ),
                const SortWidget(),

                const SizedBox(
                  height: 14.0,
                ),
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
                const SizedBox(
                  height: 14.0,
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
