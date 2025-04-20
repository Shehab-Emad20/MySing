import 'package:flutter/material.dart';
import 'dart:async';
import 'package:mikhail_samuel/splash/presentation/views/widgets/splash_view.dart';
import 'package:mikhail_samuel/home/view/home_view.dart';

class AnimatedSplashView extends StatefulWidget {
  final String title;
  const AnimatedSplashView({super.key, required this.title});

  @override
  _AnimatedSplashViewState createState() => _AnimatedSplashViewState();
}

class _AnimatedSplashViewState extends State<AnimatedSplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // تهيئة الأنيميشن
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // تشغيل الأنيميشن
    _controller.forward();

    // التنقل التلقائي بعد 3 ثواني
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeView.routeName);
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // تنظيف الـ controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: SplashView(title: widget.title),
      ),
    );
  }
}
