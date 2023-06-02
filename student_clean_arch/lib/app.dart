import 'package:flutter/material.dart';

import 'view/batch_view.dart';
import 'view/register_view.dart';
import 'view/login_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/loginRoute',
      routes: {
        '/loginRoute': (context) => const LoginView(),
        '/registerRoute': (context) => const RegisterView(),
        '/batchRoute': (context) => const BatchView(),
      },
    );
  }
}
