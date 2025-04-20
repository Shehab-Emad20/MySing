import 'package:flutter/material.dart';
import 'package:mikhail_samuel/home/view/home_view.dart';
import 'package:mikhail_samuel/splash/presentation/views/home_page.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case HomeView.routeName:
      return MaterialPageRoute(builder: (_) => const HomeView());
    case HomePage.routeName:
      return MaterialPageRoute(builder: (_) => const HomePage());
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('Page not found')),
        ),
      );
  }
}
