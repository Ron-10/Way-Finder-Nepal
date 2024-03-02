import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'recommended_places.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TravelApp(),
  ));
}

class TravelApp extends StatefulWidget {
  const TravelApp({super.key});

  @override
  _TravelAppState createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  final List<String> _selectedInterests = [];
  List<Map<String, dynamic>> _recommendedPlaces = [];
  final Map<String, List<String>> _recommendations = {
    'Nature': [
      'Hiking in the mountains',
      'Exploring wildlife sanctuaries',
      'Bird watching',
      'National Park Safaris',
      'Exploring Lakes'
    ],
    'Culture': [
      'Visiting historical sites',
      'Visiting museums and galleries',
      'Attending cultural events',
      'Homestays with Local Communities',
      'Visits to Sacred Sites',
      'Visits to Temples and Monasteries'
    ],
    'Adventure': [
      'Rafting in white water',
      'Paragliding',
      'Rock climbing',
      'Bungee Jumping',
      'Mountain Biking',
      'Zip-lining',
      'Canyoning',
    ],
  };

  Future<void> sendSelectedInterests(BuildContext context) async {
    try {
      List<String> selectedSubInterests = [];
      List<String> selectedMainInterests = [];

      // Add selected sub-interests to the list and corresponding main interests if applicable
      for (var option in _recommendations.keys) {
        for (var subInterest in _recommendations[option]!) {
          if (_selectedInterests.contains(subInterest)) {
            selectedSubInterests.add(subInterest.toLowerCase());
            selectedMainInterests.add(option.toLowerCase());
          }
        }
      }

      final List<String> options = [
        ...selectedSubInterests,
        ...selectedMainInterests
      ];

      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/recommend_places/'),
        body: jsonEncode({'options': options}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        List<dynamic> recommendedSites = json.decode(response.body);
        setState(() {
          _recommendedPlaces =
              recommendedSites.map<Map<String, dynamic>>((site) {
            return {
              'name': site['name'],
              'description': site['description'],
              'isExpanded': false,
            };
          }).toList();
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecommendedPlacesScreen(_recommendedPlaces),
          ),
        );
      } else {
        throw Exception('Failed to send selected interests');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // Implement your logic when "Where to?" is tapped
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(16, 25, 16, 0),
                  width: double.infinity,
                  height: 135,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Bon Voyage',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff111417),
                            ),
                          ),
                          SizedBox(
                            height: 110,
                            child: Icon(Icons.airplane_ticket_rounded,
                                size: 26, color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 7),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Implement your logic when popular destination 1 is tapped
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        padding: const EdgeInsets.fromLTRB(16, 8, 32, 8),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xffeff2f4),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 12),
                              width: 34,
                              height: 24,
                              child: const Icon(Icons.search,
                                  size: 24, color: Colors.black),
                            ),
                            Flexible(
                              child: TextField(
                                controller: _searchController,
                                decoration: const InputDecoration(
                                  hintText: 'Where to?',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Text(
                      'Popular destinations',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff111417),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
                width: double.infinity,
                height: 170,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // Destination Card 1
                      GestureDetector(
                        onTap: () {
                          // Implement your logic when popular destination 1 is tapped
                        },
                        child: _buildDestinationCard(
                            'Mt. Everest', 'assets/mt.png'),
                      ),
                      const SizedBox(width: 12),
                      // Destination Card 2
                      GestureDetector(
                        onTap: () {
                          // Implement your logic when popular destination 2 is tapped
                        },
                        child: _buildDestinationCard(
                            'Pokhara', 'assets/pokhara.png'),
                      ),
                      const SizedBox(width: 12),
                      // Destination Card 3
                      GestureDetector(
                        onTap: () {
                          // Implement your logic when popular destination 3 is tapped
                        },
                        child:
                            _buildDestinationCard('Tilicho', 'assets/til.png'),
                      ),
                    ],
                  ),
                ),
              ),
              // Categories Section
              Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Categories',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff111417),
                      ),
                    ),
                    const SizedBox(height: 19.5),
                    // Displaying Interests

                    _displayInterests(),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  sendSelectedInterests(context);
                },
                child: Text('Show Places'),
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 164, 174, 231),
                  textStyle: TextStyle(fontSize: 18.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
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
      ),
    );
  }

  Widget _buildDestinationCard(String destination, String imagePath) {
    return Container(
      padding: const EdgeInsets.only(bottom: 12),
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            width: 160,
            height: 90,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            destination,
            style: const TextStyle(
              fontFamily: 'Plus Jakarta Sans',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xff111417),
            ),
          ),
        ],
      ),
    );
  }

  Widget _displayInterests() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _recommendations.keys.map((category) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff111417),
              ),
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _recommendations[category]!
                  .map((subInterest) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.0),
                        child: CheckboxListTile(
                          title: Text(subInterest),
                          value: _selectedInterests.contains(subInterest),
                          onChanged: (value) {
                            setState(() {
                              if (value!) {
                                _selectedInterests.add(subInterest);
                              } else {
                                _selectedInterests.remove(subInterest);
                              }
                            });
                          },
                        ),
                      ))
                  .toList(),
            ),
            SizedBox(height: 24),
          ],
        );
      }).toList(),
    );
  }
}
