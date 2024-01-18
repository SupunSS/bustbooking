import 'package:flutter/material.dart';
import 'login_page.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Main Home Page',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF39DFF9),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF39DFF9), Colors.white],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add an Image widget with your image asset
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'images/bus.png', // Replace with your actual image asset path
                width: 200, // Adjust the width as needed
                height: 200, // Adjust the height as needed
              ),
            ),
            const SizedBox(height: 30), // Increased spacing
            const Text(
              'Welcome!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30), // Increased spacing
            ElevatedButton(
              onPressed: () {
                // Navigate to the Login page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Blue color for the button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10), // Adjust border radius as needed
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 50, vertical: 14), // Adjust padding
              ),
              child: const Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 20, // Increased font size
                  color: Colors.white, // White color for the text
                  fontWeight: FontWeight.bold, // Bold text
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
