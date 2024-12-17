import 'package:flutter/material.dart';
import 'package:yours_news/shared/constant/colors.dart';
import 'package:yours_news/shared/widget/profile_stats.dart';
import 'package:yours_news/shared/widget/secondary_button.dart';

class ProfileInfo extends StatelessWidget {
  final String image;
  final int news;
  final int followers;
  final int following;
  final bool isPersonalProfile;

  const ProfileInfo({
    super.key,
    required this.image,
    required this.news,
    required this.followers,
    required this.following,
    required this.isPersonalProfile,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        SizedBox(
          height: 110,
          width: 110,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(6),
            ),
            child: Image.asset(image),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfileStats(title: 'News', count: news),
                  ProfileStats(title: 'Followers', count: followers),
                  ProfileStats(title: 'Following', count: following),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              if (isPersonalProfile)
                SecondaryButton(
                  text: "Create news",
                  onPressed: () {},
                  width: double.infinity,
                  height: 42,
                  tcolor: AppColor.color121314,
                  bgcolor: AppColor.color121314.withOpacity(0.08),
                ),
              if (!isPersonalProfile)
                SecondaryButton(
                  text: "Follow",
                  onPressed: () {},
                  width: double.infinity,
                  height: 42,
                  tcolor: AppColor.white,
                  bgcolor: Colors.black,
                )
            ],
          ),
        ),
      ],
    );
  }
}
