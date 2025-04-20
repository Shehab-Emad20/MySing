import 'package:flutter/material.dart';
import 'package:mikhail_samuel/core/utils/app_colors.dart';
import 'package:mikhail_samuel/core/utils/app_text_styles.dart';

AppBar buildAppBar(context, {required String title}) {
  return AppBar(
    backgroundColor: AppColors.primaryColor,
    centerTitle: true,
    title: Text(title, textAlign: TextAlign.center, style: TextStyles.bold28),
  );
}
