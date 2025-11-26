import 'package:flutter/material.dart';
import 'package:news_app/common/app_theme.dart';
import 'package:news_app/features/main_layer.dart';

import 'common/service_locator/getit/di.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      initialRoute: MainLayer.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routes: {
        MainLayer.routeName: (context) => MainLayer()
      }
    );
  }
}
