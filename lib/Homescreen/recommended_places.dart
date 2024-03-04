import 'package:flutter/material.dart';

class RecommendedPlacesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> recommendedPlaces;

  const RecommendedPlacesScreen(this.recommendedPlaces, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommended Places'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two items per row
          childAspectRatio: 0.85, // Adjusted aspect ratio for the card
        ),
        itemCount: recommendedPlaces.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child:
                        Placeholder(), // Placeholder for the image (to be replaced)
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      recommendedPlaces[index]['name'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the detailed description screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DescriptionScreen(
                              description: recommendedPlaces[index]
                                  ['description'],
                            ),
                          ),
                        );
                      },
                      child: const Text('Learn More'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DescriptionScreen extends StatelessWidget {
  final String description;

  const DescriptionScreen({Key? key, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Description'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            description,
            style: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
