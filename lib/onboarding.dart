import 'package:firstproject/compoments/color.dart';
import 'package:firstproject/compoments/onboarding_data.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key})
      : super(key: key); // Fixed super.key to Key? key

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = Onboardingdata(); // Corrected class name to match import
  final pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 229, 229, 1),
      body: Column(
        children: [
          body(),
          buildDots(), // Moved body() inside the Column children
          button(),
        ],
      ),
    );
  }

  Widget body() {
    // Moved the body() method inside the _OnboardingPageState class
    return Expanded(
      child: Center(
        child: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          controller: pageController, // Added controller to PageView.builder
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      controller.items[currentIndex].image,
                      height: 350,
                      width: 600,
                    ),

                    //Titles
                    Text(
                      controller.items[currentIndex].title,
                      style: const TextStyle(
                          fontSize: 25,
                          color: primaryColor,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),

                    //Description
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        controller.items[currentIndex].description,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ));
          },
        ),
      ),
    );
  }

  Widget buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          controller.items.length,
          (index) => AnimatedContainer(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: currentIndex == index ? primaryColor : Colors.grey,
              ),
              height: 7,
              width: currentIndex == index ? 30 : 10,
              duration: const Duration(milliseconds: 700))),
    );
  }

  Widget button() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width * .9,
      height: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: primaryColor),
      child: TextButton(
        onPressed: () {
          if (currentIndex == controller.items.length - 1) {
            // Check if it's the last page
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      HomePage()), // Navigate to the home screen
            );
          } else {
            setState(() {
              currentIndex++; // Move to the next page
            });
          }
        },
        child: Text(
          currentIndex == controller.items.length - 1
              ? "Get started"
              : "Continue",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
