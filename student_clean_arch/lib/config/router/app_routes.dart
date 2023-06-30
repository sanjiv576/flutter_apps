import '../../features/auth/presentation/view/login_view.dart';
import '../../features/auth/presentation/view/register_view.dart';
import '../../features/batch/presentation/view/batch_view.dart';
import '../../features/course/presentation/view/course_view.dart';
import '../../features/home/presentation/view/home_view.dart';
import '../../features/splash/presentation/view/splash_view.dart';

class AppRoutes {
  AppRoutes._();

  static const String splashRoute = '/splash';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String batchRoute = '/batch';
  static const String courseRoute = '/course';
  static const String homeRoute = '/home';

  static getAppRoutes() {
    return {
      splashRoute: (context) => const SplashView(),
      loginRoute: (context) => const LoginView(),
      registerRoute: (context) => const RegisterView(),
      batchRoute: (context) => const BatchView(),
      courseRoute: (context) => const CourseView(),
      homeRoute: (context) => const HomeView(),
    };
  }
}
