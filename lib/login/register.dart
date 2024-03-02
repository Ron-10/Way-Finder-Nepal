import 'package:flutter/material.dart';

import '../Homescreen/homepage.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    String name = '';
    String dob = '';
    String address = '';
    String email = '';
    String phoneNumber = '';

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
              const SizedBox(height: 20), // Adjust space between app bar and image
              const SizedBox(height: 20), // Adjust space between image and box fields
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  onChanged: (value) {
                    dob = value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Date of Birth',
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  onChanged: (value) {
                    address = value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  onChanged: (value) {
                    phoneNumber = value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Check if any field is empty
                  if (name.isEmpty ||
                      dob.isEmpty ||
                      address.isEmpty ||
                      email.isEmpty ||
                      phoneNumber.isEmpty) {
                    // Show a dialog asking to fill all fields
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Missing Information'),
                          content: const Text('Please fill in all fields.'),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeApp()),
                    );
                    // Proceed with registration
                    // Implement registration functionality here
                  }
                },
                child: const Text('Register !!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
