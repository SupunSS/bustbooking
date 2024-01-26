import 'package:flutter/material.dart';
import 'Bus_seats.dart'; // Import the BusSeats page

class BusSchedule extends StatelessWidget {
  const BusSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Schedule'),
        foregroundColor: Color(0xFFFFFFFF),
        backgroundColor: const Color(0xFFE14D42),
      ),
      body: Container(
        color: const Color(0xFFE14D42),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  'images/pngwing.com.png',
                  fit: BoxFit.cover, // Adjust the fit as needed
                ),
              ),
              const SizedBox(height: 20),
              _buildBusScheduleItem('Bus 1', 'Route A', '10:00 AM', context),
              _buildBusScheduleItem('Bus 2', 'Route B', '11:30 AM', context),
              _buildBusScheduleItem('Bus 3', 'Route C', '1:00 PM', context),
              _buildBusScheduleItem('Bus 4', 'Route D', '2:30 PM', context),
              _buildBusScheduleItem('Bus 5', 'Route E', '4:00 PM', context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBusScheduleItem(
      String busName, String route, String time, BuildContext context) {
    return InkWell(
      onTap: () {
        _handleBusScheduleTap(context, busName);
      },
      child: Container(
        width: double.infinity,
        height: 120,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bus Name: $busName',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0)),
              ),
              const SizedBox(height: 8.0),
              Text('Route: $route',
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
              const SizedBox(height: 8.0),
              Text('Departure Time: $time',
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
            ],
          ),
        ),
      ),
    );
  }

  void _handleBusScheduleTap(BuildContext context, String busName) {
    // Navigate to the BusSeats page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BusSeats(busName: busName),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: BusSchedule(),
  ));
}
