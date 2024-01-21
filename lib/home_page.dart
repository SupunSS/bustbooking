import 'package:flutter/material.dart';
import 'bus_schedule.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedMonth = '';
  String selectedDate = '';
  String selectedYear = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Navigate back to the login page
              Navigator.pop(context);
            },
          ),
        ],
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

                // Text Inputs for Date (MM/DD/YYYY)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Month Input
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          selectedMonth = value;
                        },
                        decoration: InputDecoration(
                          labelText: 'Month',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                      ),
                    ),
                    const SizedBox(width: 10),

                    // Date Input
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          selectedDate = value;
                        },
                        decoration: InputDecoration(
                          labelText: 'Date',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                      ),
                    ),
                    const SizedBox(width: 10),

                    // Year Input
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          selectedYear = value;
                        },
                        decoration: InputDecoration(
                          labelText: 'Year',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                      ),
                    ),
                  ],
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
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    minimumSize: const Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
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
