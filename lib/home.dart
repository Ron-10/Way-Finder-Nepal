import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom App Bar Example"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Text('Selected Tab Index: $_selectedIndex'),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.purple,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: InkWell(
                onTap: () => _onItemTapped(0),
                child: Container(
                  height: kBottomNavigationBarHeight,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.home, color: _selectedIndex == 0 ? Colors.white : Colors.grey),
                      Text('Home', style: TextStyle(color: _selectedIndex == 0 ? Colors.white : Colors.grey)),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () => _onItemTapped(1),
                child: Container(
                  height: kBottomNavigationBarHeight,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.explore, color: _selectedIndex == 1 ? Colors.white : Colors.grey),
                      Text('Explore', style: TextStyle(color: _selectedIndex == 1 ? Colors.white : Colors.grey)),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () => _onItemTapped(2),
                child: Container(
                  height: kBottomNavigationBarHeight,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.favorite, color: _selectedIndex == 2 ? Colors.white : Colors.grey),
                      Text('Favorites', style: TextStyle(color: _selectedIndex == 2 ? Colors.white : Colors.grey)),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () => _onItemTapped(3),
                child: Container(
                  height: kBottomNavigationBarHeight,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.person, color: _selectedIndex == 3 ? Colors.white : Colors.grey),
                      Text('Profile', style: TextStyle(color: _selectedIndex == 3 ? Colors.white : Colors.grey)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
