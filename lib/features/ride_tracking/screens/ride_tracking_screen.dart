import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class RideTrackingScreen extends StatefulWidget {
  const RideTrackingScreen({super.key});

  @override
  State<RideTrackingScreen> createState() =>
      _RideTrackingScreenState();
}

class _RideTrackingScreenState extends State<RideTrackingScreen> {
  Timer? timer;

  int index = 0;

  String status = "Driver En Route";

  final List<LatLng> route = [
    LatLng(-1.2921, 36.8219),
    LatLng(-1.2915, 36.8227),
    LatLng(-1.2909, 36.8235),
    LatLng(-1.2903, 36.8243),
    LatLng(-1.2897, 36.8251),
  ];

  late LatLng currentPosition = route[0];

  @override
  void initState() {
    super.initState();
    startRide();
  }

  void startRide() {
    timer = Timer.periodic(const Duration(seconds: 2), (t) {
      if (!mounted) return;

      if (index >= route.length) {
        setState(() {
          status = "Completed";
          currentPosition = route.last;
        });
        t.cancel();
        return;
      }

      setState(() {
        currentPosition = route[index];

        // ✅ STRICT 4-STEP FLOW (matches spec)
        if (index == 0) {
          status = "Driver En Route";
        } else if (index == 1) {
          status = "Driver Arrived";
        } else if (index == 2 || index == 3) {
          status = "In Trip";
        } else {
          status = "In Trip";
        }

        index++;
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ride Tracking"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FlutterMap(
              options: MapOptions(
                initialCenter: currentPosition,
                initialZoom: 15,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: currentPosition,
                      width: 50,
                      height: 50,
                      child: const Icon(
                        Icons.directions_car,
                        color: Colors.blue,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Bottom status + driver card
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
                  title: Text("John Driver"),
                  subtitle: Text("KDA 123A"),
                  trailing: Text("⭐ 4.9"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}