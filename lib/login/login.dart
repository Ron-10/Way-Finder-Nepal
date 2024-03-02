import 'package:firstproject/login/register.dart';
import 'package:flutter/material.dart';
import '../Homescreen/homepage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Way Finder Nepal',
          style: TextStyle(
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Add photo
              Image.asset(
                'assets/195.jpg', // Path to your photo asset
                height: 300, // Adjust the height as needed
              ),
              const SizedBox(height: 20), // Add space between photo and input fields
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
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    border: InputBorder.none, // Remove the default input border
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    border: InputBorder.none, // Remove the default input border
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 20),
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
                          title: const Text('Missing Information'),
                          content: const Text('Please enter both email and password.'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    // Navigate to HomePage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeApp()),
                    );
                  }
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 20),
              // Register button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to register page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const RegisterPage()),
                      );
                    },
                    child: const Text('Register'),
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
