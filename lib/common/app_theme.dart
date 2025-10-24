import 'package:flutter/material.dart';
import 'package:news_app/common/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.whiteColor,
    primaryColor: AppColors.blackColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.whiteColor,
      iconTheme: IconThemeData(color: AppColors.blackColor),
    ),
    textTheme: _appTextTheme(color: AppColors.blackColor),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.blackColor,
    primaryColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.blackColor,
      iconTheme: IconThemeData(color: AppColors.whiteColor),
    ),
    textTheme: _appTextTheme(color: AppColors.whiteColor),
  );

  static TextTheme _appTextTheme({required Color color}) {
    return TextTheme(
      bodySmall: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: color,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: color,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: color,
      ),

      titleSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: color,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: color,
      ),
      titleLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: color,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 24,
        color: color,
      ),
      labelMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: color,
      ),
    );
  }
}
