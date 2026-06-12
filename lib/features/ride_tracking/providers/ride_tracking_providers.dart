import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../models/ride_state.dart';
import '../models/ride_status.dart';

class RideTrackingNotifier
    extends StateNotifier<RideState> {
  RideTrackingNotifier()
      : super(
          RideState(
            driverLocation:
                LatLng(-1.2921, 36.8219),
            status: RideStatus.enRoute,
          ),
        );

  Timer? _timer;

  final List<LatLng> route = [
    LatLng(-1.2921, 36.8219),
    LatLng(-1.2915, 36.8227),
    LatLng(-1.2909, 36.8235),
    LatLng(-1.2903, 36.8243),
    LatLng(-1.2897, 36.8251),
    LatLng(-1.2890, 36.8260),
  ];

  int currentIndex = 0;

  void startTracking() {
    _timer = Timer.periodic(
      const Duration(seconds: 2),
      (timer) {
        currentIndex++;

        if (currentIndex >= route.length) {
          state = state.copyWith(
            status: RideStatus.completed,
          );

          timer.cancel();
          return;
        }

        RideStatus status;

        if (currentIndex < 2) {
          status = RideStatus.enRoute;
        } else if (currentIndex < 4) {
          status = RideStatus.arrived;
        } else {
          status = RideStatus.inTrip;
        }

        state = state.copyWith(
          driverLocation: route[currentIndex],
          status: status,
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final rideTrackingProvider =
    StateNotifierProvider<
        RideTrackingNotifier,
        RideState>(
  (ref) => RideTrackingNotifier(),
);