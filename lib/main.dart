import 'package:flutter/material.dart';
import 'main_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Ticket Booking App',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set the app's primary color
      ),
      home: const MainHomePage(), // Specify the initial page to display
    );
  }
}
