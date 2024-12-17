import 'package:flutter/material.dart';
import 'package:yours_news/features/home/screen/publisher_screen.dart';
import 'package:yours_news/shared/constant/colors.dart';
import 'package:yours_news/shared/widget/secondary_button.dart';

class PublisherTile extends StatelessWidget {
  final String logoUrl;
  final String publisherName;

  const PublisherTile({
    super.key,
    required this.logoUrl,
    required this.publisherName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PublisherScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Container(
          width: 150,
          height: 180,
          decoration: BoxDecoration(
            color: AppColor.colorF9FCFE,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: Column(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(logoUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(publisherName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: AppColor.color1A1A1A,
                  )),
              const SizedBox(height: 10),
              SecondaryButton(
                  text: "Follow",
                  onPressed: () {},
                  width: 115,
                  height: 40,
                  tcolor: AppColor.color121314,
                  bgcolor: AppColor.colorECECED)
            ],
          ),
        ),
      ),
    );
  }
}
