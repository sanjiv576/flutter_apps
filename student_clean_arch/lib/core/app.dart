import 'package:flutter/material.dart';

import '../config/router/app_routes.dart';
import '../config/themes/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getApplicationTheme(),
      initialRoute: AppRoutes.splashRoute,
      routes: AppRoutes.getAppRoutes(),
    );
  }
}
