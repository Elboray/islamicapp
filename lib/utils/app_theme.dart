import 'package:flutter/material.dart';
import 'package:islamicapp/utils/app_colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.transparentColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.blackColor,
    ),
    // textTheme: TextTheme(
    //   headlineLarge: TextStyle(
    //     fontWeight: FontWeight.bold,
    //     fontSize: 16,
    //     color: AppColors.whiteColor,
    //   ),
    // ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackBgColor,
      centerTitle: true,
      iconTheme: IconThemeData(color: AppColors.primaryColor),
    ),
  );
}
