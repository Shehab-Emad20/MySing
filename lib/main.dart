import 'package:flutter/material.dart';
import 'package:mikhail_samuel/core/helper_function/on_generate_routes.dart';
import 'package:mikhail_samuel/splash/presentation/views/home_page.dart';

void main() {
  runApp(MySine());
}

class MySine extends StatelessWidget {
  const MySine({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoutes,
      initialRoute: HomePage.routeName,
    );
  }
}
