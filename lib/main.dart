import 'package:asd/src/core/app/app.dart';
import 'package:asd/src/core/di/dependency_injection.dart';
import 'package:flutter/material.dart';

void main() async {
  await registerDependencies();
  runApp(
    const App(),
  );
}
