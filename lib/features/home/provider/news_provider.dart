import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:yours_news/features/home/model/card_item.dart';

final cardListProvider = StateProvider<List<CardItem>>((ref) {
  return [
    CardItem(
      imageUrl: 'assets/png/h1.jpg',
      title: 'Global Summit on Climate Change: Historic Agreement Reached',
      logoUrl: 'assets/png/bbc.png',
      text: 'BBC News',
      icon: IconsaxPlusBold.verify,
      date: 'Jun 9, 2023',
      tag: 'Enviroment',
    ),
    CardItem(
      imageUrl: 'assets/png/h2.jpg',
      title: 'Tech Giant Unveils Revolutionary AI-powered Device',
      logoUrl: 'assets/png/times.png',
      text: 'The NYT',
      icon: IconsaxPlusBold.verify,
      date: 'Jun 9, 2023',
      tag: 'Technology',
    ),
];
});
