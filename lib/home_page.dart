import 'package:flutter/material.dart';
import 'main_home_page.dart';
import 'search_buses_page.dart'; // Import the main home page

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue, // Light blue color at the top
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Navigate to the MainHomePage on log out
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MainHomePage()),
              );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white, // White color in the middle part
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'welcome to the ticket booking app',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the Search Buses page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchBusesPage()),
                  );
                },
                child: const Text('Search for Buses'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
