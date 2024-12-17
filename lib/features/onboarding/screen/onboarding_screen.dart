import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:yours_news/features/auth/screen/signin_screen.dart';
import 'package:yours_news/shared/constant/colors.dart';
import 'package:yours_news/shared/widget/custom_button.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final image = [
    "assets/png/1s.jpg",
    "assets/png/2s.jpg",
    "assets/png/3s.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final double height = size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: height / 2,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    image[index],
                    fit: BoxFit.fill,
                  ),
                );
              },
              autoplay: true,
              pagination: const SwiperPagination(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(top: 10),
                builder: DotSwiperPaginationBuilder(
                    color: Colors.white,
                    activeColor: AppColor.primaryColor,
                    activeSize: 20),
              ),
              itemCount: 3,
              viewportFraction: 0.8,
              scale: 0.9,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 50,
            ),
            child: Column(
              children: [
                Text(
                  "First to know",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                 SizedBox(
                  height: 10,
                ),
                Text("All news in one place, be\n the first to know last news",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: height / 20,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                text: "Get Started",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignIn(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
