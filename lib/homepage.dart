import 'package:flutter/material.dart';
import 'recommended_places.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tourism Recommendation System'),
          backgroundColor: Colors.indigo,
        ),
        body: TourismRecommendation(),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}

class TourismRecommendation extends StatefulWidget {
  @override
  _TourismRecommendationState createState() => _TourismRecommendationState();
}

class _TourismRecommendationState extends State<TourismRecommendation> {
  List<String> _selectedInterests = [];
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
      'Canyoning'
    ],
  };

  Future<void> sendSelectedInterests() async {
    try {
      List<String> lowercaseInterests =
      _selectedInterests.map((interest) => interest.toLowerCase()).toList();

      final response = await http.post(
        Uri.parse('http://127.0.0.1:8000/recommend_places/'),
        body: jsonEncode({'options': lowercaseInterests}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        List<dynamic> recommendedSites = json.decode(response.body);
        setState(() {
          _recommendedPlaces = recommendedSites.map<Map<String, dynamic>>((site) {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 20.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Discover Your Next Adventure',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.indigo, // Set the color to indigo
              decoration: TextDecoration.none, // Remove underline
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Expanded(
          child: ListView.builder(
            itemCount: _recommendations.length,
            itemBuilder: (context, index) {
              final interest = _recommendations.keys.elementAt(index);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_selectedInterests.contains(interest)) {
                          _selectedInterests.remove(interest);
                        } else {
                          _selectedInterests.add(interest);
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: _selectedInterests.contains(interest)
                            ? Colors.indigo.withOpacity(0.3)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.indigo),
                      ),
                      child: Center(
                        child: Text(
                          interest,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                            decoration: TextDecoration.none, // Remove underline
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (_selectedInterests.contains(interest))
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _recommendations[interest]!
                          .map((subInterest) => Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.0),
                        child: Material(
                          // Wrap ListTile with Material
                          child: CheckboxListTile(
                            title: Text(subInterest),
                            value: _selectedInterests
                                .contains(subInterest),
                            onChanged: (value) {
                              setState(() {
                                if (value!) {
                                  _selectedInterests
                                      .add(subInterest);
                                } else {
                                  _selectedInterests
                                      .remove(subInterest);
                                }
                              });
                            },
                          ),
                        ),
                      ))
                          .toList(),
                    ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            sendSelectedInterests();
          },
          child: Text('Show Places'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white, // Set button color to white
            textStyle: TextStyle(fontSize: 18.0, color: Colors.black), // Set text color to black
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}
