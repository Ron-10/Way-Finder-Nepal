import 'package:flutter/material.dart';

class RecommendedPlacesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> recommendedPlaces;

  RecommendedPlacesScreen(this.recommendedPlaces);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recommended Places'),
        backgroundColor: Colors.indigo,
      ),
      body: ListView.builder(
        itemCount: recommendedPlaces.length,
        itemBuilder: (context, index) {
          final place = recommendedPlaces[index];
          return ExpansionTile(
            title: Text(place['name']),
            children: [
              ListTile(
                title: Text(place['description']),
              ),
            ],
          );
        },
      ),
    );
  }
}
