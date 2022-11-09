import 'package:flutter/material.dart';
import 'package:transit_app/pages/splashscreen.dart';
import 'package:transit_app/pages/setup.dart';
import 'package:transit_app/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Satoshi',
      ),
      initialRoute: '/setup',
      routes: {
        '/': (context) => const SplashScreen(),
        '/setup': (context) => const SetupPage(),
        '/home': (context) => const HomePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
