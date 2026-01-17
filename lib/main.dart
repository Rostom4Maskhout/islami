import 'package:flutter/material.dart';
import 'package:islami/provider/most_recent_provider.dart';
import 'package:islami/screens/home_screen.dart';
import 'package:islami/screens/onboarding_screen.dart';
import 'package:islami/screens/sura_details_screen.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:islami/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create:(context)=> MostRecentProvider(),
      child: const MyApp()));
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

