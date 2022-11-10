import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:transit_app/pages/scheduled/scheduled_form.dart';
import 'package:transit_app/pages/splashscreen.dart';
import 'package:transit_app/pages/login.dart';
import 'package:transit_app/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("Unable to connect to Firebase");
          print(snapshot.error);
        }
        if (snapshot.connectionState == ConnectionState.done) {
          print("Connected to Firebase");
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              fontFamily: 'Satoshi',
              primarySwatch: Colors.green,
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => const SplashScreen(),
              '/login': (context) => const LoginPage(),
              '/home': (context) => const HomePage(),
              '/scheduled': (context) => ScheduledForm(),
            },
            debugShowCheckedModeBanner: false,
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
