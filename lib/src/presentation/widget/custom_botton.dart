import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class CustomBottom extends StatelessWidget {
  const CustomBottom({
    super.key,
    this.onPressed,
    required this.bottomText,
  });
  final void Function()? onPressed;
  final String bottomText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonColor,
        fixedSize: const Size(340, 55),
      ),
      onPressed: onPressed,
      child: Text(
        bottomText,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}