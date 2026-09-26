class Venue {
  final String id;
  final String name;
  final String location;
  final String status;
  final int capacity;
  final String imageUrl;

  Venue({
    required this.id,
    required this.name,
    required this.location,
    required this.status,
    required this.capacity,
    required this.imageUrl,
  });

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      status: json['status'],
      capacity: json['capacity'],
      imageUrl: json['imageUrl'],
    );
  }
}
