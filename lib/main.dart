import 'package:firstproject/onboarding.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Set debugShowCheckedModeBanner to false
      home: const SplashScreen(), // Display splash screen initially
      routes: {
        '/home': (context) => const OnboardingPage(),
        // Define main screen route
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Delay navigation to the home screen for 3 seconds
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushReplacementNamed(context, '/home');
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/b.png'), // Specify the image asset
            fit: BoxFit
                .cover, // Adjust the image size to cover the entire container
          ),
        ),
        width: double.infinity, // Set width to match the screen width
        height: double.infinity, // Set height to match the screen height
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}






