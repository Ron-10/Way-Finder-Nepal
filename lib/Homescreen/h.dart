import 'package:flutter/material.dart';

void main() {
  runApp(TravelApp());
}

class TravelApp extends StatefulWidget {
  @override

  _TravelAppState createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {
  int _selectedIndex = 0;

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SizedBox(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Header Section
                  GestureDetector(
                    onTap: () {
                      // Implement your logic when "Where to?" is tapped
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(16, 25, 16, 0), // Adjusted padding for better layout
                      width: double.infinity,
                      height: 135, // Increased height to accommodate content
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Bon Voyage',
                                style: TextStyle(
                                  fontFamily: 'Plus Jakarta Sans',
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff111417),
                                ),
                              ),
                              Container(
                                height: 110,
                                child: Icon(Icons.airplane_ticket_rounded, size: 26, color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Popular Destinations Section
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 7),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Implement your logic when popular destination 1 is tapped
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 30), // Increased bottom margin for better spacing
                            padding: EdgeInsets.fromLTRB(16, 8, 32, 8), // Adjusted padding for search box
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xffeff2f4),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 12),
                                  width: 34,
                                  height: 24,
                                  child: Icon(Icons.search, size: 24, color: Colors.black),
                                ),
                                Flexible(
                                  child: TextField(
                                    controller: _searchController,
                                    decoration: InputDecoration(
                                      hintText: 'Where to?',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
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
                  // Destination Cards Section
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 16, 0, 16),
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
                            child: _buildDestinationCard('Mt. Everest', 'assets/mt.png'),
                          ),
                          SizedBox(width: 12),
                          // Destination Card 2
                          GestureDetector(
                            onTap: () {
                              // Implement your logic when popular destination 2 is tapped
                            },
                            child: _buildDestinationCard('Pokhara', 'assets/pokhara.png'),
                          ),
                          SizedBox(width: 12),
                          // Destination Card 3
                          GestureDetector(
                            onTap: () {
                              // Implement your logic when popular destination 3 is tapped
                            },
                            child: _buildDestinationCard('Tilicho', 'assets/til.png'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Categories Section
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff111417),
                          ),
                        ),
                        SizedBox(height: 19.5),
                        // Adventure Category
                        _buildCategoryDropdown('Adventure'),
                        SizedBox(height: 24),
                        // Nature Category
                        _buildCategoryDropdown('Nature'),
                        SizedBox(height: 24),
                        // Culture Category
                        _buildCategoryDropdown('Culture'),
                        SizedBox(height: 24),
                        // Show Places Button
                        _buildShowPlacesButton(),
                      ],
                    ),
                  ),
                ],
              ),
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
        ),
      ),
    );
  }

  Widget _buildDestinationCard(String destination, String imagePath) {
    return Container(
      padding: EdgeInsets.only(bottom: 12),
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 12),
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
            style: TextStyle(
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

  Widget _buildCategoryDropdown(String category) {
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
        Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            color: Color(0xffeff2f4),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            underline: SizedBox(),
            items: [
              DropdownMenuItem(
                value: 'Spot 1',
                child: Text('Spot 1'),
              ),
              DropdownMenuItem(
                value: 'Spot 2',
                child: Text('Spot 2'),
              ),
              DropdownMenuItem(
                value: 'Spot 3',
                child: Text('Spot 3'),
              ),
            ],
            onChanged: (value) {
              // Implement your logic when a spot is selected
            },
            hint: Text(
              'Select a $category spot',
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff607a89),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildShowPlacesButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32),
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          // Implement your logic for Show Places button
        },
        style: ElevatedButton.styleFrom(
          primary: Color(0xffeff2f4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Show Places',
          style: TextStyle(
            fontFamily: 'Plus Jakarta Sans',
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Color(0xff111417),
          ),
        ),
      ),
    );
  }
}
