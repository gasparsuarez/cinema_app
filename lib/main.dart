import 'package:cinema_app/config/routes/app_routes.dart';
import 'package:cinema_app/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routerLinks,
      title: 'Cinema App',
      theme: AppTheme().getTheme(),
    );
  }
}
