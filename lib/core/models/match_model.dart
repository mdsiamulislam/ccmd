class MatchResult {
  final String winnerClubId;
  final String summary;
  final String scoreA;
  final String scoreB;

  MatchResult({
    required this.winnerClubId,
    required this.summary,
    required this.scoreA,
    required this.scoreB,
  });

  factory MatchResult.fromJson(Map<String, dynamic> json) {
    return MatchResult(
      winnerClubId: json['winnerClubId'],
      summary: json['summary'],
      scoreA: json['scoreA'],
      scoreB: json['scoreB'],
    );
  }
}

class Match {
  final String id;
  final String tournamentId;
  final bool isOpeningMatch;
  final String clubAId;
  final String clubBId;
  final String date;
  final String time;
  final String venueId;
  final List<String> umpireIds;
  final String status;
  final MatchResult? result;

  Match({
    required this.id,
    required this.tournamentId,
    required this.isOpeningMatch,
    required this.clubAId,
    required this.clubBId,
    required this.date,
    required this.time,
    required this.venueId,
    required this.umpireIds,
    required this.status,
    this.result,
  });

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      id: json['id'],
      tournamentId: json['tournamentId'],
      isOpeningMatch: json['isOpeningMatch'],
      clubAId: json['clubAId'],
      clubBId: json['clubBId'],
      date: json['date'],
      time: json['time'],
      venueId: json['venueId'],
      umpireIds: List<String>.from(json['umpireIds']),
      status: json['status'],
      result: json['result'] != null ? MatchResult.fromJson(json['result']) : null,
    );
  }
}
