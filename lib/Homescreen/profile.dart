import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        children: [
          // Profile Picture
          Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/aab.jpeg'),
                fit: BoxFit.fitHeight, // Use BoxFit.fill to show the full image
              ),
            ),
          ),
          // Personal Information
          const ListTile(
            title: Text('Name'),
            subtitle: Text('John Doe'),
          ),
          const ListTile(
            title: Text('Email Address'),
            subtitle: Text('johndoe@example.com'),
          ),
          const ListTile(
            title: Text('Date of Birth'),
            subtitle: Text('1990-01-01'),
          ),
          const ListTile(
            title: Text('Gender'),
            subtitle: Text('Male'),
          ),
          const ListTile(
            title: Text('Nationality'),
            subtitle: Text('United States'),
          ),
          // Contact Information
          const ListTile(
            title: Text('Phone Number'),
            subtitle: Text('123-456-7890'),
          ),
          const ListTile(
            title: Text('Address'),
            subtitle: Text('123 Main Street, Springfield, IL 62704'),
          ),
          // Travel Preferences
          const ListTile(
            title: Text('Favorite Destinations'),
            subtitle: Text('Paris, London, Tokyo'),
          ),
          const ListTile(
            title: Text('Travel Style'),
            subtitle: Text('Adventure'),
          ),
          const ListTile(
            title: Text('Budget Range'),
            subtitle: Text('500 - 1000'),
          ),
          const ListTile(
            title: Text('Preferred Accommodation Type'),
            subtitle: Text('Hotels'),
          ),
          // Travel History
          const ListTile(
            title: Text('Past Trips'),
            subtitle: Text('New York City, San Francisco'),
          ),
          // Bucket List
          const ListTile(
            title: Text('Places to Visit'),
            subtitle: Text('Rome, Sydney, Beijing'),
          ),
          // Interests
          const ListTile(
            title: Text('Activities'),
            subtitle: Text('Hiking, Food Tasting, Museums'),
          ),
          const ListTile(
            title: Text('Cuisine Preferences'),
            subtitle: Text('Italian, Japanese, Mexican'),
          ),
          // Social Media Integration
          const ListTile(
            title: Text('Social Media'),
            subtitle: Text('LinkedIn, Twitter, Instagram'),
          ),
          // Settings
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              // Navigate to settings page
            },
          ),
          // Rewards and Loyalty Points
          const ListTile(
            title: Text('Rewards and Loyalty Points'),
            subtitle: Text('1000 points'),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          switch (index) {
            case 0:
            // Navigate to Home page
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
            // Navigate to Favorites page
              Navigator.pushNamed(context, '/Wishlist');
              break;
            case 2:
            // Navigate to Search page
              Navigator.pushNamed(context, '/Trips');
              break;
            case 3:
            // Navigate to Profile page
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