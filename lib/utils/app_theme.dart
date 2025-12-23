import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundColor,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: AppColors.primaryColor
        ),
      ),
      textTheme: TextTheme(
        headlineMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white
        )
      )

  );


}