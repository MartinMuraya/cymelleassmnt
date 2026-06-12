# Cymelle Flutter Assessment

OVERVIEW:

This project is a Flutter-based mini application implementing a simple e-commerce flow and a simulated ride tracking system. It was built as part of a technical assessment to demonstrate UI development, state management, and basic system design in Flutter.

THE APPLICATION INCLUDES:

Product listing with cart functionality.
Cart management with quantity management.
Simulated checkout flow.
Ride tracking screen with map-based driver movement.

TECH STACK:

Flutter
Riverpod for state management.
flutter_map for map rendering.
latlong2 for geolocation coordinates.
HTTP for mock/future API integration.

FEATURES:

PRODUCT MODULE:

Displays products in a grid layout.
Add to cart functionality.
Increase/decrease item quantity.
Remove individual items.
Clear entire cart.
Live cart total calculation.
Cart Module.
Centralized cart state using Riverpod.
Real-time UI updates.
Checkout navigation to ride tracking screen.
Ride Tracking Module.
Map-based UI using OpenStreetMap tiles via flutter_map.
Simulated driver movement using a Timer.
Predefined route with step-by-step movement.

STATUS FLOW:

Driver En Route
Driver Arrived
In Trip
Completed
Driver information card (name, vehicle plate, rating).


STATE MANAGEMENT:

Riverpod was used to manage application state.

Reason for choice:

Clean separation between UI and business logic.
Reactive updates without manual setState calls.
Scales well for multiple modules (cart, ride tracking).
Easier to maintain compared to tightly coupled widget state.


RIDE TRACKING LOGIC:

The ride tracking simulation uses a Timer that updates the driver position every 2 seconds.

A predefined list of coordinates represents the route
Each timer tick moves the driver to the next coordinate
Status updates are based on route progression
Once the route is completed, the trip is marked as finished.

This approach simulates real-time movement in a simplified and controlled manner.


HOW TO RUN:

flutter pub get
flutter run -d chrome

NOTES:

No backend was integrated; all data is mocked or simulated.
Cart state is stored in-memory (not persisted).
Ride tracking is a simulation and does not use real GPS data.


SUMMARY:

This project focuses on clean UI composition, basic state management and simulating real-world behavior in a controlled flutter environment.