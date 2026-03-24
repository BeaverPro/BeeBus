import 'package:flutter/material.dart';
import 'package:beebus/theme/app_theme.dart';
import 'package:beebus/screens/home_screen.dart';

void main() {
  runApp(const BeeBusApp());
}

class BeeBusApp extends StatelessWidget {
  const BeeBusApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BeeBus',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
