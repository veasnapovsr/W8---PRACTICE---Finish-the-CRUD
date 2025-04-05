class FirebaseLocationRepository extends LocationRepository {
  @override
  Future<void> createLocation(String id, String country, String name) async {
    const String baseUrl =
        "https://g3-pov-veasna-default-rtdb.asia-southeast1.firebasedatabase.app/";
    const String locations = "location";
    final String newLocationUrl = '$baseUrl/$locations/$id.json';

    // Prepare data for new location
    Map<String, dynamic> locationData = {"country": country, "name": name};

    final http.Response response = await http.put(
      Uri.parse(newLocationUrl),
      body: json.encode(locationData),
    );
  }
}
