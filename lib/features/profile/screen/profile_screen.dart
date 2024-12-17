// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yours_news/features/auth/screen/signin_screen.dart';
import 'package:yours_news/shared/constant/colors.dart';
import 'package:yours_news/shared/widget/custom_appbar.dart';
import 'package:yours_news/shared/widget/profile_info.dart';
import 'package:yours_news/shared/widget/sort_widget.dart';

class ProfileScreen extends HookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Profile",
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(IconsaxPlusLinear.setting_2),
            onSelected: (value) {
              if (value == 'logout') {
                _logout(context);
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Logout'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
        ],
      ),
      backgroundColor: Colors.white,
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "thetylerm_news",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColor.color999999,
                ),
              ),
              SizedBox(height: 10),
              ProfileInfo(
                image: "assets/png/profile.png",
                isPersonalProfile: true,
                news: 0,
                followers: 100,
                following: 200,
              ),
              SizedBox(height: 25),
              Text(
                "Tyler Mason News",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: AppColor.color1A1A1A,
                ),
              ),
              Text(
                "This is Tyler Mason News, Enjoy!",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColor.color666666,
                ),
              ),
              SizedBox(height: 25),
              Text(
                "Your news",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: AppColor.color1A1A1A,
                ),
              ),
              Center(
                child: SortWidget(),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "You don’t have any news, make some.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColor.color999999,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SignIn(),
      ),
    );
  }
}
