import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    runApp(const App());
  }, (error, stack) async {
    log('Error: ${error.toString()}', error: error, stackTrace: stack);
  });
}
