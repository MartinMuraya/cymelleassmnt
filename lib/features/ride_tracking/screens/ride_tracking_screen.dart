import 'dart:async';

import 'package:flutter/material.dart';

class RideTrackingScreen extends StatefulWidget {
  const RideTrackingScreen({super.key});

  @override
  State<RideTrackingScreen> createState() =>
      _RideTrackingScreenState();
}

class _RideTrackingScreenState
    extends State<RideTrackingScreen> {

  String status = "Driver En Route";

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 10),
      startRideSimulation,
    );
  }

  void startRideSimulation() {
    Future.delayed(
      const Duration(seconds: 5),
      () {
        setState(() {
          status = "Driver Arrived";
        });
      },
    );

    Future.delayed(
      const Duration(seconds: 10),
      () {
        setState(() {
          status = "In Trip";
        });
      },
    );

    Future.delayed(
      const Duration(seconds: 15),
      () {
        setState(() {
          status = "Completed";
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ride Tracking',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey.shade300,
              child: const Center(
                child: Text(
                  'Map goes here',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  status,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 16),

                const ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text('John Driver'),
                  subtitle: Text('KDA 123A'),
                  trailing: Text('⭐ 4.9'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}