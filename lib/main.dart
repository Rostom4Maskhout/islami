import 'package:flutter/material.dart';
import 'package:islami/screens/home_screen.dart';
import 'package:islami/screens/onboarding_screen.dart';
import 'package:islami/screens/sura_details_screen.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:islami/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onBoardingRoute,
      routes: {
        AppRoutes.onBoardingRoute : (context)=> OnboardingScreen(),
        AppRoutes.homeRoute :(context)=> HomeScreen(),
        AppRoutes.suraDetailsRoute :(context)=> SuraDetailsScreen(),


      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}

