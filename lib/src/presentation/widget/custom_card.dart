import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.cardText,
  });
  final String cardText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: double.infinity,
      child: DecoratedBox(
        decoration: const BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.all(
              Radius.circular(14),
            )
        ),
        child: Center(
          child: Text(
            cardText,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w500,
              fontFamily: "Raleway2",
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}