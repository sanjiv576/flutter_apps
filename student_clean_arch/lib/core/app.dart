import 'package:flutter/material.dart';
import 'package:student_clean_arch/config/themes/app_theme.dart';

import '../features/auth/presentation/view/login_view.dart';
import '../features/auth/presentation/view/register_view.dart';
import '../features/batch/presentation/view/batch_view.dart';
import '../features/course/presentation/view/course_view.dart';
import '../features/home/presentation/view/home_view.dart';
import '../features/splash/presentation/view/splash_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getApplicationTheme(),
      initialRoute: '/splashRoute',
      routes: {
        '/splashRoute': (context) => const SplashView(),
        '/loginRoute': (context) => const LoginView(),
        '/registerRoute': (context) => const RegisterView(),
        '/batchRoute': (context) => const BatchView(),
        '/courseRoute': (context) => const CourseView(),
        '/homeRoute': (context) => const HomeView(),
      },
    );
  }
}
