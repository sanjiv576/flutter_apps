import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:student_clean_arch/core/network/local/hive_service.dart';

import 'core/app.dart';

void main() {
  // initialize Hive before running flutter app
  WidgetsFlutterBinding.ensureInitialized();
  HiveService().init();
  runApp(const ProviderScope(child: App()));
}
