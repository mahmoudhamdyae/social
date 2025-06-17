import 'package:flutter/material.dart';
import 'package:social/features/main_screen.dart';

import 'core/resources/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social App',
      theme: getApplicationTheme(context),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}