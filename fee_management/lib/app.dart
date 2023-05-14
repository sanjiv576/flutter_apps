
import 'package:flutter/material.dart';

import 'view/dashboard_view.dart';
import 'view/sign_in_view.dart';
import 'view/signup_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/signUpRoute',
      routes: {
        '/signUpRoute': (context) => const SignUpView(),
        '/signInRoute': (context) => const SignInView(),
        '/dashboardRoute': (context) => const DashboardView(),
      },
    );
  }
}
