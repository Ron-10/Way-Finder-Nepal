import 'package:flutter/material.dart';

void main() {
  runApp(const TripsPage());
}


class TripsPage extends StatefulWidget {
  const TripsPage({super.key});

  @override
  _TripsPageState createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
  int _selectedIndex = 2;

  final Map<String, List<String>> trips = {
    "Kathmandu": ["Visit Durbar Square", "Explore Swayambhunath Stupa", "Shop at Thamel"],
    "Pokhara": ["Boating in Phewa Lake", "Visit Davis Falls", "Hike to World Peace Pagoda"],
    "Chitwan National Park": ["Elephant Safari", "Jungle Walk", "Canoeing in Rapti River"]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trips in Nepal'),
      ),
      body: ListView.builder(
        itemCount: trips.length,
        itemBuilder: (context, index) {
          String destination = trips.keys.elementAt(index);
          List<String> activities = trips.values.elementAt(index);
          return Card(
            child: Column(
              children: <Widget>[
                Text(destination, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Column(
                  children: activities.map((activity) => ListTile(title: Text(activity))).toList(),
                ),
              ],
            ),
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
              Navigator.pushNamed(context, '/Wishlist');
              break;
            case 2:
            // No need to navigate, already on Trips page
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
