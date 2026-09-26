import 'package:ccmd/core/models/club_model.dart';
import 'package:ccmd/core/models/match_model.dart';
import 'package:ccmd/core/models/player_model.dart';
import 'package:ccmd/core/models/tournament_model.dart';
import 'package:ccmd/core/models/umpire_model.dart';
import 'package:ccmd/core/models/venue_model.dart';
import 'package:ccmd/core/services/data_service.dart';
import 'package:ccmd/features/fixtures/screens/fixtures_screen.dart';
import 'package:ccmd/features/home/screens/home_screen.dart';
import 'package:ccmd/features/more/screens/more_screen.dart';
import 'package:ccmd/features/players/screens/players_screen.dart';
import 'package:ccmd/features/tournaments/screens/tournaments_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LandingController extends GetxController {
  RxInt curent_index = 0.obs;
  RxBool isLoading = true.obs;

  Rxn<Tournament> activeTournament = Rxn<Tournament>();
  RxList<Club> clubs = <Club>[].obs;
  RxList<Player> players = <Player>[].obs;
  RxList<Umpire> umpires = <Umpire>[].obs;
  RxList<Venue> venues = <Venue>[].obs;
  RxList<Match> matches = <Match>[].obs;

  final DataService _dataService = DataService();

  List<Widget> screens = [
    HomeScreen(),
    TournamentsScreen(),
    FixturesScreen(),
    PlayersScreen(),
    MoreScreen(),
  ];

  @override
  void onInit() {
    super.onInit();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final data = await _dataService.loadMockData();

      final tournaments = (data['tournaments'] as List)
          .map((e) => Tournament.fromJson(e))
          .toList();
      activeTournament.value = tournaments.firstWhere((t) => t.status == 'Ongoing');

      clubs.assignAll((data['clubs'] as List).map((e) => Club.fromJson(e)).toList());
      players.assignAll((data['players'] as List).map((e) => Player.fromJson(e)).toList());
      umpires.assignAll((data['umpires'] as List).map((e) => Umpire.fromJson(e)).toList());
      venues.assignAll((data['venues'] as List).map((e) => Venue.fromJson(e)).toList());
      matches.assignAll((data['matches'] as List).map((e) => Match.fromJson(e)).toList());

    } catch (e) {
      debugPrint('Error loading data: $e');
    } finally {
      isLoading.value = false;
    }
  }
}