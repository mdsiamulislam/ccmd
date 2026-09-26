class Club {
  final String id;
  final String name;
  final String logoUrl;
  final String representative;
  final Map<String, String> contact;
  final String homeVenueId;
  final List<String> playerIds;
  final int playerCount;

  Club({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.representative,
    required this.contact,
    required this.homeVenueId,
    required this.playerIds,
    required this.playerCount,
  });

  factory Club.fromJson(Map<String, dynamic> json) {
    return Club(
      id: json['id'],
      name: json['name'],
      logoUrl: json['logoUrl'],
      representative: json['representative'],
      contact: Map<String, String>.from(json['contact']),
      homeVenueId: json['homeVenueId'],
      playerIds: List<String>.from(json['playerIds']),
      playerCount: json['playerCount'],
    );
  }
}
