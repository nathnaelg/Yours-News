import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:yours_news/features/bookmark/screen/bookmark_screen.dart';
import 'package:yours_news/features/discover/screen/discover_screen.dart';
import 'package:yours_news/features/home/screen/home_screen.dart';
import 'package:yours_news/features/profile/screen/profile_screen.dart';
import 'package:yours_news/shared/constant/colors.dart';

final bottomNavIndexProvider = StateProvider<int>((ref) => 0);

class BottomNavigation extends HookConsumerWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(bottomNavIndexProvider);
    final PageController pageController =
        PageController(initialPage: selectedIndex);

    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          ref.read(bottomNavIndexProvider.notifier).state = index;
        },
        children: const [
          HomeScreen(),
          DiscoverScreen(),
          BookmarkScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: GNav(
        selectedIndex: selectedIndex,
        onTabChange: (index) {
          ref.read(bottomNavIndexProvider.notifier).state = index;
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
        color: Colors.grey,
        activeColor: Colors.black, 

        padding: const EdgeInsets.all(18),
        gap: 8,
        backgroundColor: Colors.white,
        tabs: [
          GButton(
            icon: IconsaxPlusBold.home_2,
            text: 'Home',
            iconColor: AppColor.color666666,
            onPressed:
                () {},
          ),
          GButton(
            icon: IconsaxPlusBold.discover,
            text: 'Discover',
            iconColor: AppColor.color666666,
            onPressed: () {},
          ),
          GButton(
            icon: IconsaxPlusBold.archive_1,
            text: 'Bookmarks',
            iconColor: AppColor.color666666,
            onPressed: () {},
          ),
          GButton(
            icon: IconsaxPlusBold.profile,
            text: 'Profile',
            iconColor: AppColor.color666666,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
