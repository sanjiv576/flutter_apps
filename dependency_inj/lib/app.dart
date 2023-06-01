import 'package:flutter/material.dart';

import 'view/data_entry_view.dart';
import 'view/homepage_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/homepageRoute',
      routes: {
        '/homepageRoute': (context) => const HomepageView(),
        '/dataEntryRoute': (context) => const DataEntryView(),
      },
    );
  }
}
