class Player {
  final String id;
  final String name;
  final String registrationId;
  final String photoUrl;
  final String clubId;
  final String dateOfBirth;
  final String nationality;
  final String playerType;
  final String role;
  final String battingStyle;
  final String bowlingStyle;

  Player({
    required this.id,
    required this.name,
    required this.registrationId,
    required this.photoUrl,
    required this.clubId,
    required this.dateOfBirth,
    required this.nationality,
    required this.playerType,
    required this.role,
    required this.battingStyle,
    required this.bowlingStyle,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'],
      name: json['name'],
      registrationId: json['registrationId'],
      photoUrl: json['photoUrl'],
      clubId: json['clubId'],
      dateOfBirth: json['dateOfBirth'],
      nationality: json['nationality'],
      playerType: json['playerType'],
      role: json['role'],
      battingStyle: json['battingStyle'],
      bowlingStyle: json['bowlingStyle'],
    );
  }
}
