import 'package:flutter/material.dart';

class WishlistApp extends StatefulWidget {
  const WishlistApp({super.key});

  @override
  _WishlistAppState createState() => _WishlistAppState();
}

class _WishlistAppState extends State<WishlistApp> {
  int _selectedIndex = 1; // Set the initial index to Wishlist
  final List<Map<String, dynamic>> wishlistItems = [
    {"name": "Pokhara", "image": "assets/pokhara.png"},
    {"name": "Annapurna", "image": "assets/nepal.png"},
    {"name": "Tilicho", "image": "assets/til.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
      ),
      body: ListView.builder(
        itemCount: wishlistItems.length,
        itemBuilder: (context, index) {
          String itemName = wishlistItems[index]["name"];
          String itemImage = wishlistItems[index]["image"];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemName,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Center( // Center the image vertically
                child: Image.asset(
                  itemImage,
                  width: 150, // Adjust the width to make the image bigger
                  height: 150, // Adjust the height to make the image bigger
                ),
              ),
              const Divider(), // Add a divider between items
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
            // Already on the Wishlist page, no need to navigate
              break;
            case 2:
              Navigator.pushNamed(context, '/Trips');
              break;
            case 3:
              Navigator.pushNamed(context, '/profile');
              break;
            default:
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_added_rounded, color: Colors.black),
            label: 'Wishlist',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map, color: Colors.black),
            label: 'Trips',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: 'Profile',
            backgroundColor: Colors.white,
          ),
        ],
        selectedItemColor: Colors.black,
        showSelectedLabels: true,
      ),
    );
  }
}
