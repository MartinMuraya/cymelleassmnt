import 'package:latlong2/latlong.dart';

import 'ride_status.dart';

class RideState {
  final LatLng driverLocation;
  final RideStatus status;

  RideState({
    required this.driverLocation,
    required this.status,
  });

  RideState copyWith({
    LatLng? driverLocation,
    RideStatus? status,
  }) {
    return RideState(
      driverLocation:
          driverLocation ?? this.driverLocation,
      status: status ?? this.status,
    );
  }
}