import 'package:flutter/material.dart';
// import 'package:provider.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);

    Widget content = CircularProgressIndicator();
    if (locationProvider.isLoading) {
      content = CircularProgressIndicator();
    } else if (locationProvider.hasData) {
      final locations = locationProvider.locations;
      content = ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return LocationTile(location: locations[index]);
        },
      );
    } else if (locationProvider.locationsState?.state ==
        AsyncValueState.error) {
      content = Center(
        child: Text("Error: ${locationProvider.locationsState!.error}"),
      );
    }
  }
}
