import 'package:flutter/material.dart';

import 'custom_card.dart';

class CustomOnboardingItem extends StatelessWidget {
  const CustomOnboardingItem({
    super.key,
    required this.icons,
    required this.titleText, required this.cardText1, required this.cardText2, required this.cardText3,

  });
  final String icons;
  final String titleText;
  final String cardText1;
  final String cardText2;
  final String cardText3;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage(icons),
          height: 30,
        ),
        Text(
          titleText,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomCard(cardText:cardText1),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomCard(cardText: cardText2),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomCard(cardText: cardText3),
        ),
      ],
    );
  }
}