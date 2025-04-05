import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

void main() async {
  const String baseUrl =
      "https://g3-pov-veasna-default-rtdb.asia-southeast1.firebasedatabase.app/";

  const String locations = "users/veasna/locations";
  const String allLOcations = '$baseUrl/$locations.json';

  Uri uri = Uri.parse(allLOcations);
  final http.Response response = await http.get(uri);

  if (response.statusCode == HttpStatus.ok) {
    final data = json.decode(response.body) as Map<String, dynamic>?;

    List<Location> result = [];
    if (data != null) {
      result = data.entries
          .map((entry) => LocationDto.fromJson(entry.key, entry.value))
          .toList();
    }

    print(result[0].country);
  }
}

class LocationDto {
  static Location fromJson(String id, Map<String, dynamic> json) {
    return Location(id: id, country: json['country'], name: json['name']);
  }
}

class Location {
  final String id;
  final String country;
  final String name;

  Location({required this.id, required this.country, required this.name});
}
