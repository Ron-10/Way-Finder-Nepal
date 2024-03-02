import 'package:firstproject/Homescreen/h.dart';
import 'package:firstproject/Homescreen/profile.dart';
import 'package:firstproject/Homescreen/trips.dart';
import 'package:firstproject/Homescreen/wishlist.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(HomeApp());
}

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  int _selectedIndex = 0;

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => TravelApp(),
        '/home': (context) => TravelApp(),
        '/Wishlist': (context) => WishlistApp(),
        '/Trips': (context) => TripsPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}

