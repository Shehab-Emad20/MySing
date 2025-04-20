import 'package:flutter/material.dart';
import 'package:mikhail_samuel/core/constets.dart';
import 'package:mikhail_samuel/core/utils/app_colors.dart';
import 'package:mikhail_samuel/core/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.imageAsset,
  });

  final VoidCallback onPressed;
  final String text;
  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 54,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onPressed,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // أيقونة على اليسار
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: khorizinatalpadding),
                child: Image.asset(imageAsset),
              ),
            ),
            // النص دائماً في المنتصف
            Text(
              text,
              style: TextStyles.bold28.copyWith(
                color: AppColors.primaryColorWithe,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
