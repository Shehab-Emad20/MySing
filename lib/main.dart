import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mikhail_samuel/core/helper_function/on_generate_routes.dart';
import 'package:mikhail_samuel/splash/presentation/views/home_page.dart';
import 'generated/l10n.dart'; // تأكد من أن هذا الملف موجود بعد التوليد

void main() {
  runApp(const MySine());
}

class MySine extends StatelessWidget {
  const MySine({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale('ar'), // اللغة الافتراضية
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoutes,
      initialRoute: HomePage.routeName,
    );
  }
}
