import 'package:ccmd/features/fixtures/screens/fixtures_screen.dart';
import 'package:ccmd/features/home/screens/home_screen.dart';
import 'package:ccmd/features/more/screens/more_screen.dart';
import 'package:ccmd/features/players/screens/players_screen.dart';
import 'package:ccmd/features/tournaments/screens/tournaments_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LandingController extends GetxController {
  RxInt curent_index = 0.obs;

  List<Widget> screens = [
    HomeScreen(),
    TournamentsScreen(),
    FixturesScreen(),
    PlayersScreen(),
    MoreScreen(),
  ];


}