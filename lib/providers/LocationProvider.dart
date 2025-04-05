import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LocationProvider extends ChangeNotifier {
  final LocationRepository _repository;
  AsyncValue<List<Location>> locationsState = AsyncValue.loading();

  LocationProvider(this._repository) {
    fetchLocations();
  }

  Future<void> fetchLocations() async {
    try {
      locationsState = AsyncValue.loading();
      notifyListeners();

      final locations = await _repository.getLocations();
      locationsState = AsyncValue.data(locations);
    } catch (error) {
      locationsState = AsyncValue.error(error);
    } finally {
      notifyListeners();
    }
  }
}