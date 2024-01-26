import 'package:flutter/material.dart';
import 'bus_schedule.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedMonth;
  String? selectedDate;
  String? selectedYear;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        foregroundColor: Color.fromARGB(255, 236, 229, 229),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Navigate back to the login page
              Navigator.pop(context);
            },
          ),
        ],
        backgroundColor: Color(0xFFE14D42),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE14D42), Colors.white],
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
                    filled: true,
                    fillColor: Colors.grey[300], // Ash color
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
                    filled: true,
                    fillColor: Colors.grey[300], // Ash color
                  ),
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                ),
                const SizedBox(height: 10),

                // Month, Date, and Year Inputs
                Row(
                  children: [
                    // Month Dropdown and Textbox
                    Expanded(
                      child: DropdownButton<String>(
                        value: selectedMonth,
                        hint: const Text('Month'),
                        items: List.generate(12, (index) {
                          return DropdownMenuItem<String>(
                            value: (index + 1).toString(),
                            child: Text((index + 1).toString()),
                          );
                        }),
                        onChanged: (value) {
                          setState(() {
                            selectedMonth = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 10),

                    // Date Dropdown and Textbox
                    Expanded(
                      child: DropdownButton<String>(
                        value: selectedDate,
                        hint: const Text('Date'),
                        items: List.generate(30, (index) {
                          return DropdownMenuItem<String>(
                            value: (index + 1).toString(),
                            child: Text((index + 1).toString()),
                          );
                        }),
                        onChanged: (value) {
                          setState(() {
                            selectedDate = value;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 10),

                    // Year Input
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          selectedYear = value;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Year',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          filled: true,
                          fillColor: Colors.grey[300], // Ash color
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
                    // Check if any of the fields are empty
                    if (selectedMonth == null ||
                        selectedDate == null ||
                        selectedYear == null) {
                      setState(() {
                        errorMessage = 'All fields must be filled!';
                      });
                    } else {
                      // Redirect to Bus Schedule page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BusSchedule(),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFFC23D34),
                    minimumSize: const Size(150, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Search Buses'),
                ),

                // Display Error Message
                if (errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      errorMessage,
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
