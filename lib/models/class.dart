class Location {
  final String id;
  final String country;
  final String name;

  Location({required this.id, required this.country, required this.name});

  @override
  bool operator ==(Object other) {
    return other is Location && other.id == id;
  }
}
