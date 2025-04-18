import 'package:flutter/material.dart';
import 'package:mikhail_samuel/utils/app_images.dart';
import 'package:mikhail_samuel/utils/app_text_styles.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.imagesApp,
            width: 150, // عرض الصورة
            height: 150, // ارتفاع الصورة
            fit: BoxFit.contain, // تناسب الصورة داخل الأبعاد المحددة
          ),
          Text(title, style: TextStyles.bold40),
        ],
      ),
    );
  }
}
