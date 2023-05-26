import 'package:flutter/material.dart';

import 'theme/app_theme.dart';
import 'view/about_us_view.dart';
import 'view/dashboard_view.dart';
import 'view/home_view.dart';
import 'view/profile_view.dart';

class App extends StatelessWidget {
  const App({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getApplicationTheme(),
      // theme: ThemeData(
      //   // Note: primarySwatch does not work while using material3 i.e. userMaterial3
      //   // primarySwatch: Colors.pink,

      //   useMaterial3: true,
      //   fontFamily: 'Montserrat',
      //   colorScheme: const ColorScheme.light(
      //     primary: Colors.green,
      //   ),
      // ),
      initialRoute: '/dashboardRoute',
      routes: {
        '/homeRoute': (context) => const HomeView(),
        '/dashboardRoute': (context) => const DashboardView(),
        '/profileRoute': (context) => const ProfileView(),
        '/aboutUsRoute': (context) => const AboutUsView(),
      },
    );
  }
}
