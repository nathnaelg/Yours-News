import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:yours_news/features/home/model/card_item.dart';
import 'package:yours_news/features/home/screen/publisher_screen.dart';
import 'package:yours_news/shared/constant/colors.dart';
import 'package:yours_news/shared/widget/outtlined_button.dart';
import 'package:yours_news/shared/widget/secondary_button.dart';



class NewsCard2 extends StatelessWidget {
  final CardItem item;
  const NewsCard2({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        15,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColor.colorF9FCFE),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PublisherScreen()));
            },
            child: Row(
              children: [
                SizedBox(
                  height: 36,
                  width: 36,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(3),
                    ),
                    child: Image.asset(item.logoUrl),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.text,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 16),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          IconsaxPlusBold.verify,
                          size: 15,
                          color: AppColor.color2ABAFF,
                        ),
                      ],
                    ),
                    Text(
                      item.date,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                SecondaryButton(
                  text: "Follow",
                  onPressed: () {},
                  width: 90,
                  height: 40,
                  tcolor: AppColor.color121314,
                  bgcolor: AppColor.color121314.withOpacity(0.08),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Transform.rotate(
                    angle: 0.5 * 3.14,
                    child: const Icon(
                      IconsaxPlusLinear.more,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            item.title,
            maxLines: 2,
            style: const TextStyle(
              color: AppColor.color1A1A1A,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomOutlinedButton(
              text: item.tag,
              onPressed: () {},
              // width: 90,
              height: 40,
              tcolor: AppColor.color2ABAFF),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 200,
            width: 360,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                item.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
