import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/app.dart';
import 'core/network/local/hive_service.dart';

void main() {
  // initialize everything what Flutter requires
  WidgetsFlutterBinding.ensureInitialized();
  // initialize Hive before running flutter app
  HiveService().init();
  runApp(const ProviderScope(child: App()));
}
