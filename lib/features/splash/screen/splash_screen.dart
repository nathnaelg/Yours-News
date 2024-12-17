import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:yours_news/features/onboarding/screen/onboarding_screen.dart';
import 'package:yours_news/shared/constant/colors.dart';
import 'package:yours_news/shared/widget/custom_navbar.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // check if the auth token is available or not
    _checkAuthToken(context);

    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Center(
        child: Image.asset(
          'assets/png/logo.png',
          width: 400,
          height: 400,
        ),
      ),
    );
  }

  Future<void> _checkAuthToken(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    // get the auth token from shared preferences
    final authToken = prefs.getString('auth_token');
    

    Timer(const Duration(seconds: 3), () {
      // check if the auth token is null or not
      if (authToken != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavigation()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnBoarding()),
        );
      }
    });
  }
}
