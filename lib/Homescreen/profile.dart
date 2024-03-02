import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        children: [
          // Profile Picture
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage('https://i.pravatar.cc/150?img=1'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Personal Information
          ListTile(
            title: Text('Name'),
            subtitle: Text('John Doe'),
          ),
          ListTile(
            title: Text('Email Address'),
            subtitle: Text('johndoe@example.com'),
          ),
          ListTile(
            title: Text('Date of Birth'),
            subtitle: Text('1990-01-01'),
          ),
          ListTile(
            title: Text('Gender'),
            subtitle: Text('Male'),
          ),
          ListTile(
            title: Text('Nationality'),
            subtitle: Text('United States'),
          ),
          // Contact Information
          ListTile(
            title: Text('Phone Number'),
            subtitle: Text('123-456-7890'),
          ),
          ListTile(
            title: Text('Address'),
            subtitle: Text('123 Main Street, Springfield, IL 62704'),
          ),
          // Travel Preferences
          ListTile(
            title: Text('Favorite Destinations'),
            subtitle: Text('Paris, London, Tokyo'),
          ),
          ListTile(
            title: Text('Travel Style'),
            subtitle: Text('Adventure'),
          ),
          ListTile(
            title: Text('Budget Range'),
            subtitle: Text('500 - 1000'),
          ),
          ListTile(
            title: Text('Preferred Accommodation Type'),
            subtitle: Text('Hotels'),
          ),
          // Travel History
          ListTile(
            title: Text('Past Trips'),
            subtitle: Text('New York City, San Francisco'),
          ),
          // Bucket List
          ListTile(
            title: Text('Places to Visit'),
            subtitle: Text('Rome, Sydney, Beijing'),
          ),
          // Interests
          ListTile(
            title: Text('Activities'),
            subtitle: Text('Hiking, Food Tasting, Museums'),
          ),
          ListTile(
            title: Text('Cuisine Preferences'),
            subtitle: Text('Italian, Japanese, Mexican'),
          ),
          // Social Media Integration
          ListTile(
            title: Text('Social Media'),
            subtitle: Text('LinkedIn, Twitter, Instagram'),
          ),
          // Settings
          ListTile(
            title: Text('Settings'),
            onTap: () {
              // Navigate to settings page
            },
          ),
          // Rewards and Loyalty Points
          ListTile(
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
        items: [
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