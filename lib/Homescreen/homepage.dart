import 'package:firstproject/Homescreen/h.dart';
import 'package:firstproject/Homescreen/profile.dart';
import 'package:firstproject/Homescreen/trips.dart';
import 'package:firstproject/Homescreen/wishlist.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const HomeApp());
}

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  final int _selectedIndex = 0;

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const TravelApp(),
        '/home': (context) => const TravelApp(),
        '/Wishlist': (context) => const WishlistApp(),
        '/Trips': (context) => const TripsPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}

