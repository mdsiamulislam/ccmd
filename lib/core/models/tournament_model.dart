class Tournament {
  final String id;
  final String name;
  final String shortName;
  final String logoUrl;
  final String startDate;
  final String endDate;
  final String status;
  final List<String> participatingClubIds;
  final int totalClubs;
  final int totalPlayers;
  final int totalMatches;
  final List<String> venueIds;

  Tournament({
    required this.id,
    required this.name,
    required this.shortName,
    required this.logoUrl,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.participatingClubIds,
    required this.totalClubs,
    required this.totalPlayers,
    required this.totalMatches,
    required this.venueIds,
  });

  factory Tournament.fromJson(Map<String, dynamic> json) {
    return Tournament(
      id: json['id'],
      name: json['name'],
      shortName: json['shortName'],
      logoUrl: json['logoUrl'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      status: json['status'],
      participatingClubIds: List<String>.from(json['participatingClubIds']),
      totalClubs: json['totalClubs'],
      totalPlayers: json['totalPlayers'],
      totalMatches: json['totalMatches'],
      venueIds: List<String>.from(json['venueIds']),
    );
  }
}
