import 'package:flutter/material.dart';
import 'login_page.dart';

class MainHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Main Home Page',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF39DFF9),
      ),
      body: Container(
        decoration: BoxDecoration(
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
            SizedBox(height: 30), // Increased spacing
            Text(
              'Welcome!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30), // Increased spacing
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
                padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: 15), // Adjust padding
              ),
              child: Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 18, // Increased font size
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
