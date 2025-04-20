import 'package:flutter/material.dart';
import 'package:mikhail_samuel/core/helper_function/build_appbar.dart';

class TranslateView extends StatelessWidget {
  const TranslateView({super.key});
  static const String routeName = 'translateView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(context, showBackButton: true));
  }
}
