import 'package:flutter/material.dart';
import 'package:yours_news/features/home/model/card_item.dart';
import 'package:yours_news/shared/constant/colors.dart';


// this class is used to create a card that will be used to display news
// this card will have an image, title, tag, logo, text, icon, and date
// this card will be used in the home screen to display news

class NewsCard1 extends StatelessWidget {
  final CardItem item;

  const NewsCard1({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColor.colorF9FCFE,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // Image section
              SizedBox(
                width: double.infinity,
                height: 160,
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    child: Image.asset(
                      item.imageUrl,
                      fit: BoxFit.cover,
                    )),
              ),
              Positioned(
                top: 8.0,
                left: 8.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: AppColor.color2ABAFF,
                  ),
                  width: 100,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: Text(
                    item.tag,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    item.title,
                    maxLines: 3,
                    softWrap: true,
                    style: const TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(item.logoUrl,
                                width: 24.0, height: 24.0),
                            const SizedBox(width: 8.0),
                            Text(item.text),
                            const SizedBox(width: 8.0),
                            Icon(
                              item.icon,
                              size: 15,
                              color: AppColor.color2ABAFF,
                            ),
                          ],
                        ),
                        Text(item.date),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
