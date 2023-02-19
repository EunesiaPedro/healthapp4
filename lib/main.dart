import 'package:flutter/material.dart';
import 'package:healthapp/homePage.dart';
import 'package:healthapp/informative/appointments.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Icons.add_circle,
        backgroundColor: Colors.blue.shade900,
        nextScreen: appointmentPage(),
        splashTransition: SplashTransition.slideTransition,
        ),
    );
  }
}

