import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:projecto2/core/app/router.dart';

void main() {
  runApp(const MainApp());
}

  

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
    );
  }
}