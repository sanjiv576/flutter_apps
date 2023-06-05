import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'view/add_view.dart';
import 'view/counter_view.dart';
import 'view/dashboard_view.dart';
import 'view/simple_interest_view.dart';

void main() {
  runApp(
    // ProviderScope() --> holds all the providers that are created
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Riverpod state management',
        initialRoute: '/',
        routes: {
          '/': (context) => const DashboardView(),
          '/counter': (context) => const CounterView(),
          '/add': (context) => const AddView(),
          '/simpleInterest': (context) => const SimpleInterestView(),
        },
      ),
    ),
  );
}
