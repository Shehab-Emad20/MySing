import 'package:flutter/material.dart';
import 'package:mikhail_samuel/core/helper_function/build_appbar.dart';
import 'package:mikhail_samuel/home/view/widgets/body_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const String routeName = 'homeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'مرحبا بك ', showBackButton: false),
      body: const BodyPage(),
    );
  }
}
