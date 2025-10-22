import 'package:flutter/material.dart';
import 'package:islamicapp/provider/most_recent_provider.dart';
import 'package:islamicapp/ui/home/home_screen.dart';
import 'package:islamicapp/ui/home/on_boarding_screen.dart';
import 'package:islamicapp/ui/home/tabs/Hadeth/hadethDetails/hadeth_details.dart';
import 'package:islamicapp/ui/home/tabs/quran/quranDetails/quran_details.dart';
import 'package:islamicapp/utils/app_routes.dart';
import 'package:islamicapp/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MostRecentProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onBoardingRouteName,
      routes: {
        AppRoutes.onBoardingRouteName: (context) => OnBoardingScreen(),
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.quranDetailsRouteName: (context) => QuranDetails(),
        AppRoutes.hadethDetailsRouteName: (context) => HadethDetails(),
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
