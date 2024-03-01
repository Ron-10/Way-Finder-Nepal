import 'package:firstproject/onboarding.dart';
import 'package:flutter/material.dart';
import 'Homescreen/homepage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Set debugShowCheckedModeBanner to false
      home: SplashScreen(), // Display splash screen initially
      routes: {
        '/home': (context) => OnboardingPage(), // Define main screen route
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Delay navigation to the home screen for 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/b.png'), // Specify the image asset
            fit: BoxFit
                .cover, // Adjust the image size to cover the entire container
          ),
        ),
        width: double.infinity, // Set width to match the screen width
        height: double.infinity, // Set height to match the screen height
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Way Finder Nepal',
          style: const TextStyle(
              fontSize: 25,
              color: Colors.purple,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Add photo
              Image.asset(
                'assets/195.jpg', // Path to your photo asset
                height: 300, // Adjust the height as needed
              ),
              SizedBox(height: 20), // Add space between photo and input fields
              // Email input field with BoxDecoration
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    border: InputBorder.none, // Remove the default input border
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Password input field with BoxDecoration
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: InputBorder.none, // Remove the default input border
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: 20),
              // Login button
              ElevatedButton(
                onPressed: () {
                  // Check if email and password are empty
                  if (_email.isEmpty || _password.isEmpty) {
                    // Show a dialog asking to enter email and password
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Missing Information'),
                          content: Text('Please enter both email and password.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    // Navigate to HomePage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => TravelApp()),
                    );
                  }
                },
                child: Text('Login'),
              ),
              SizedBox(height: 20),
              // Register button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to register page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => RegisterPage()),
                      );
                    },
                    child: Text('Register'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _name = '';
    String _dob = '';
    String _address = '';
    String _email = '';
    String _phoneNumber = '';

    return Scaffold(
        appBar: AppBar(
        title: const Text(
        'Register',
        style: TextStyle(
        fontSize: 25,
        color: Colors.purple,
        fontWeight: FontWeight.bold,
    ),
    ),
    centerTitle: true,
    ),
    backgroundColor: Colors.white,
    body: SingleChildScrollView(
    child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 20), // Adjust space between app bar and image
        /*Image.asset(
                'assets/til.png', // Path to your image asset
                height: 150, // Adjust the height as needed
              ),*/
        SizedBox(height: 20), // Adjust space between image and box fields
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            onChanged: (value) {
              _name = value;
            },
            decoration: InputDecoration(
              labelText: 'Name',
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            onChanged: (value) {
              _dob = value;
            },
            decoration: InputDecoration(
              labelText: 'Date of Birth',
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.datetime,
          ),
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            onChanged: (value) {
              _address = value;
            },
            decoration: InputDecoration(
              labelText: 'Address',
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            onChanged: (value) {
              _email = value;
            },
            decoration: InputDecoration(
              labelText: 'Email',
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            onChanged: (value) {
              _phoneNumber = value;
            },
            decoration: InputDecoration(
              labelText: 'Phone Number',
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.phone,
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            // Check if any field is empty
            if (_name.isEmpty ||
                _dob.isEmpty ||
                _address.isEmpty ||
                _email.isEmpty ||
                _phoneNumber.isEmpty) {
              // Show a dialog asking to fill all fields
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Missing Information'),
                    content: Text('Please fill in all fields.'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => TravelApp()),
              );
              // Proceed with registration
              // Implement registration functionality here
            }
          },
          child: Text('Register !!'),
        ),
      ],
    ),
    ),
    ),
    );
  }
}