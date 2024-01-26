// ignore: file_names
import 'package:flutter/material.dart';
import 'main_home_page.dart';

void main() {
  runApp(const MaterialApp(
    home: BusSeats(busName: 'Your Bus Name'),
  ));
}

class BusSeats extends StatefulWidget {
  final String busName;

  const BusSeats({Key? key, required this.busName}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BusSeatsState createState() => _BusSeatsState();
}

class _BusSeatsState extends State<BusSeats> {
  List<bool> selectedSeats = List.generate(54, (index) => false);
  double baseTicketPrice = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.busName),
        foregroundColor: const Color(0xFFFFFFFF),
        backgroundColor: const Color(0xFFE6594F),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFE6594F),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: Colors.white,
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Base Ticket Price: \Rs ${baseTicketPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Heavitas',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Selected Seats: ${selectedSeats.where((seat) => seat).length}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Heavitas',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Total Price: Rs ${calculateTotalPrice().toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Heavitas',
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              buildSeatRow(1, 4),
              const SizedBox(height: 8.0),
              buildSeatRow(5, 8),
              const SizedBox(height: 8.0),
              buildSeatRow(9, 12),
              const SizedBox(height: 8.0),
              buildSeatRow(13, 16),
              const SizedBox(height: 8.0),
              buildSeatRow(17, 20),
              const SizedBox(height: 8.0),
              buildSeatRow(29, 32),
              const SizedBox(height: 8.0),
              buildSeatRow(33, 36),
              const SizedBox(height: 8.0),
              buildSeatRow(37, 40),
              const SizedBox(height: 8.0),
              buildSeatRow(41, 44),
              const SizedBox(height: 8.0),
              buildSeatRow(46, 49),
              const SizedBox(height: 8.0),
              buildSeatRow(50, 53),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Handle the confirm action here
                  showBookingSuccessDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFFC23D34), // White text color
                  minimumSize: const Size(150, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Confirm'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSeatRow(int start, int end) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(end - start + 1, (index) {
        return buildSeat(start + index - 1);
      }),
    );
  }

  Widget buildSeat(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSeats[index] = !selectedSeats[index];
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: selectedSeats[index] ? Colors.yellow : Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8.0),
        ),
        width: 40.0,
        height: 40.0,
        child: Center(
          child: Text(
            '${index + 1}',
            style: TextStyle(
              color: selectedSeats[index] ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  double calculateTotalPrice() {
    int selectedSeatsCount =
        selectedSeats.where((seat) => seat).toList().length;
    return baseTicketPrice * selectedSeatsCount;
  }

  void showBookingSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Booking Successful'),
          content: const Text(
            'Thank You',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const MainHomePage(), // Replace with your home page
                  ),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
