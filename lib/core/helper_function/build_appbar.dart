import 'package:flutter/material.dart';
import 'package:mikhail_samuel/core/utils/app_colors.dart';
import 'package:mikhail_samuel/core/utils/app_text_styles.dart';

AppBar buildAppBar(
  BuildContext context, {
  String? title,
  bool showBackButton = true,
}) {
  return AppBar(
    backgroundColor: AppColors.primaryColor,
    centerTitle: true,
    leading:
        showBackButton
            ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            )
            : null,
    title:
        title != null
            ? Text(title, textAlign: TextAlign.center, style: TextStyles.bold28)
            : null,
  );
}
