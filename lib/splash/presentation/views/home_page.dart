import 'package:flutter/material.dart';
import 'package:mikhail_samuel/splash/presentation/views/widgets/animated_splash_view.dart';
import 'package:mikhail_samuel/utils/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: AnimatedSplashView(title: 'MySing'),
    );
  }
}
