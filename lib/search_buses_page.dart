import 'package:flutter/material.dart';

class SearchBusesPage extends StatelessWidget {
  const SearchBusesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search for Buses'),
      ),
      body: const Center(
        child: Text('Search Buses Page'),
      ),
    );
  }
}
