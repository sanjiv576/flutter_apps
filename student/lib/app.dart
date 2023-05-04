import 'package:flutter/material.dart';

import 'view/display_student_view.dart';
import 'view/student_detail_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/studentDetialRoute',
      routes: {
        '/studentDetialRoute': (context) => const StudentDetailView(),
        '/displayStudentRoute': (context) => const DisplayStudentView(),
      },
    );
  }
}
