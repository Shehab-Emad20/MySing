import 'package:flutter/material.dart';
import 'package:mikhail_samuel/core/constets.dart';
import 'package:mikhail_samuel/core/utils/app_images.dart';
import 'package:mikhail_samuel/core/utils/app_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchTextFiield extends StatelessWidget {
  const SearchTextFiield({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: khorizinatalpadding,
      ), // ← صغر من الناحيتين
      width: double.infinity, // ← ياخد كل العرض المتاح بعد الهوامش
      height: 45,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color:  Color(0x0A000000),
            spreadRadius: 2,
            blurRadius: 9,
            offset:  Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        keyboardType: TextInputType.text,
        style: TextStyles.bold28.copyWith(fontSize: 16),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SvgPicture.asset(
              Assets.imagesSearchIcon,
              height: 20,
              width: 20,
            ),
          ),
          hintText: "البحث",
          hintStyle: TextStyles.bold28.copyWith(
            fontSize: 16,
            color: const Color(0xFF949D9E),
          ),
          filled: true,
          fillColor: Colors.white,
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(width: 1, color: Colors.black26),
    );
  }
}
