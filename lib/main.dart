import 'package:firstproject/onboarding.dart';
import 'package:flutter/material.dart';
import 'Homescreen/homepage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'login/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Set debugShowCheckedModeBanner to false
      home: SplashScreen(), // Display splash screen initially
      routes: {
        '/home': (context) => OnboardingPage(),
        // Define main screen route
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Delay navigation to the home screen for 3 seconds
    Future.delayed(Duration(seconds: 6), () {
      Navigator.pushReplacementNamed(context, '/home');
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/b.png'), // Specify the image asset
            fit: BoxFit
                .cover, // Adjust the image size to cover the entire container
          ),
        ),
        width: double.infinity, // Set width to match the screen width
        height: double.infinity, // Set height to match the screen height
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}






