import 'package:flutter/material.dart';
import 'bus_schedule.dart'; // Import the bus_schedule.dart file

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Navigate back to the login page
              Navigator.pop(context);
            },
          ),
        ],
        backgroundColor:
            const Color(0xFF39DFF9), // Matching the Login page color
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF39DFF9), Colors.white],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text Input for Destination
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Destination',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                ),
                const SizedBox(height: 10),

                // Text Input for From
                TextField(
                  decoration: InputDecoration(
                    labelText: 'From',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                ),
                const SizedBox(height: 10),

                // Text Input for Date (MM/DD/YYYY)
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Date (MM/DD/YYYY)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                ),
                const SizedBox(height: 20),

                // Search Buses Button
                ElevatedButton(
                  onPressed: () {
                    // Redirect to Bus Schedule page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BusSchedule()),
                    );
                  },
                  child: const Text('Search Buses'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
