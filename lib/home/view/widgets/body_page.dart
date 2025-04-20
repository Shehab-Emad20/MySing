import 'package:flutter/material.dart';
import 'package:mikhail_samuel/core/helper_function/custom_button.dart';
import 'package:mikhail_samuel/core/utils/app_images.dart';

class BodyPage extends StatelessWidget {
  const BodyPage({super.key});
  static const String routeName = 'homeView';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomButton(
            onPressed: () {},
            text: "Translate",
            imageAsset: Assets.imagesTranslate,
          ),
          const SizedBox(height: 20),
          CustomButton(
            onPressed: () {},
            text: "Dictionary",
            imageAsset: Assets.imagesdictionary,
          ),
        ],
      ),
    );
  }
}
