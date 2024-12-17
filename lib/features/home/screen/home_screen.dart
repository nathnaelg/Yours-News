import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:yours_news/features/home/provider/news_provider.dart';
import 'package:yours_news/features/home/widget/news_card1.dart';
import 'package:yours_news/features/home/widget/news_card2.dart';
import 'package:yours_news/shared/constant/colors.dart';
import 'package:yours_news/shared/widget/custom_appbar.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardItems = ref.watch(cardListProvider);
    return Scaffold(
      appBar: CustomAppBar(
        leading: GestureDetector(
          onTap: () {},
          child: Container(
            height: 50,
            width: 60,
            // padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle,
              border: Border.all(
                width: 1,
                color: AppColor.colorEDEDED,
              ),
            ),
            child: const Icon(IconsaxPlusLinear.menu),
          ),
        ),
        leadingPadding: 10,
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
            child: const Icon(IconsaxPlusLinear.notification),
          ),
          const SizedBox(width: 20),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Welcome back, Tyler!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const Text(
                "Discover a world of news that matters to you",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: AppColor.textColor,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Trending news",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    child: const Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.textColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 310,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cardItems.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 300,
                      child: NewsCard1(item: cardItems[index]),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24.0),
              const Text(
                "Recommendation",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: AppColor.color1A1A1A,
                ),
              ),
              const SizedBox(height: 16),
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
    );
  }
}
