import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/app_theme.dart';
import 'package:news_app/common/settings_cubit/settings_cubit.dart';
import 'package:news_app/common/settings_cubit/settings_state.dart';
import 'package:news_app/features/main_layer.dart';
import 'package:news_app/generated/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  ThemeMode savedTheme;
  String savedLocale;

  switch (prefs.getString('themeMode') ?? 'light') {
    case 'dark':
      savedTheme = ThemeMode.dark;
      break;
    case 'system':
      savedTheme = ThemeMode.system;
      break;
    default:
      savedTheme = ThemeMode.light;
  }

  savedLocale = prefs.getString('localization') ?? 'en';

  runApp(BlocProvider(
    create: (context) => SettingsCubit(
      initialTheme: savedTheme,
      initialLocale: savedLocale,
    ),
    child: const MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: MainLayer.routeName,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: state.themeMode,
          routes: {MainLayer.routeName: (context) => MainLayer()},
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: state.locale,
        );
      },
    );
  }
}
