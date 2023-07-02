import 'package:hive_and_api_for_class/features/arithmetic/arithmetic_view.dart';
import 'package:hive_and_api_for_class/features/auth/presentation/view/login_view.dart';
import 'package:hive_and_api_for_class/features/auth/presentation/view/register_view.dart';
import 'package:hive_and_api_for_class/features/course/presentation/view/add_course_view.dart';
import 'package:hive_and_api_for_class/features/home/presentation/view/home_view.dart';
import 'package:hive_and_api_for_class/features/splash/presentation/view/splash_view.dart';

class AppRoute {
  AppRoute._();

  static const String splashRoute = '/splash';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String addCourseRoute = '/addCourse';
  static const String arithmeticRoute = '/arithmetic';

  static getApplicationRoute() {
    return {
      splashRoute: (context) => const SplashView(),
      loginRoute: (context) => const LoginView(),
      homeRoute: (context) => const HomeView(),
      registerRoute: (context) => const RegisterView(),
      addCourseRoute: (context) => const AddCourseView(),
      arithmeticRoute: (context) => const ArithmeticView(),
    };
  }
}
