import 'package:flutter/material.dart';
import 'package:mikhail_samuel/splash/presentation/views/widgets/splash_view.dart';

class AnimatedSplashView extends StatefulWidget {
  final String title;
  const AnimatedSplashView({super.key, required this.title});

  @override
  // ignore: library_private_types_in_public_api
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

    // تهيئة الـ AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // تهيئة الـ opacityAnimation
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // تهيئة الـ scaleAnimation
    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // تشغيل الأنيميشن
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // التأكد من التخلص من الـ controller
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
