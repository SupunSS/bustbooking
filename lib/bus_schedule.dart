import 'dart:convert';
import 'package:bustbooking/Bus_seats.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class BusSchedule extends StatefulWidget {
  final String from;
  final String to;

  BusSchedule({Key? key, required this.from, required this.to})
      : super(key: key);

  @override
  _BusScheduleState createState() => _BusScheduleState();
}

class _BusScheduleState extends State<BusSchedule> {
  late Future<List<Widget>> _busScheduleFuture;

  @override
  void initState() {
    super.initState();
    _busScheduleFuture = _fetchBusSchedule();
  }

  Future<List<Widget>> _fetchBusSchedule() async {
    Dio dio = Dio();

    List<Widget> widgets = [];

    try {
      Response response = await dio.post(
          'http://localhost:5000/api/buses/search',
          data: {"from": widget.from, "destination": widget.to});
      Map<String, dynamic> jsonResponse = json.decode(response.toString());

      if (jsonResponse.containsKey('data')) {
        List<dynamic> busesData = jsonResponse['data'];
        busesData.forEach((bus) {
          widgets.add(_buildBusScheduleItem(
            bus['_id'],
            bus['name'],
            bus['route'],
            bus['departuretime'],
            context,
          ));
        });
      }
    } catch (e) {
      print('Error fetching bus schedule: $e');
      // Handle error
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Schedule'),
        foregroundColor: Colors.white,
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
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              FutureBuilder<List<Widget>>(
                future: _busScheduleFuture,
                builder: (BuildContext context,
                    AsyncSnapshot<List<Widget>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Column(
                      children: snapshot.data ?? [],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBusScheduleItem(String? id, String? busName, String? route,
      String? time, BuildContext context) {
    return InkWell(
      onTap: () {
        _handleBusScheduleTap(context, id ?? '', busName ?? '');
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
                'Bus Name: ${busName ?? ''}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Route: ${route ?? ''}',
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                'Departure Time: ${time ?? ''}',
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleBusScheduleTap(BuildContext context, String id, String busName) {
    // Navigate to the BusSeats page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BusSeats(id: id, busName: busName),
      ),
    );
  }
}
