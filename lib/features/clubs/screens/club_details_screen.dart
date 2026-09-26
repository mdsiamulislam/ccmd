import 'package:ccmd/core/models/club_model.dart';
import 'package:ccmd/features/landing/controllers/landing_controller.dart';
import 'package:ccmd/features/players/screens/player_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

class ClubDetailsScreen extends StatelessWidget {
  final Club club;

  const ClubDetailsScreen({super.key, required this.club});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final landingController = Get.find<LandingController>();

    final clubPlayers = landingController.players
        .where((p) => p.clubId == club.id || club.playerIds.contains(p.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(club.name),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Container(
                    width: 76.w,
                    height: 76.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: theme.colorScheme.primary,
                        width: 2.w,
                      ),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      club.name.isNotEmpty ? club.name.substring(0, 2).toUpperCase() : 'CB',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    club.name,
                    textAlign: TextAlign.center,
                    style: textTheme.titleLarge?.copyWith(
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'Representative: ${club.representative}',
                    textAlign: TextAlign.center,
                    style: textTheme.bodySmall?.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Card(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 10.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact Information',
                        style: textTheme.titleSmall?.copyWith(fontSize: 14.sp),
                      ),
                      SizedBox(height: 8.h),
                      ...club.contact.entries.map((entry) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  entry.key.capitalizeFirst ?? entry.key,
                                  style: textTheme.bodySmall?.copyWith(fontSize: 12.sp),
                                ),
                                Text(
                                  entry.value,
                                  style: textTheme.bodySmall?.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Players (${clubPlayers.length})',
                style: textTheme.titleSmall?.copyWith(fontSize: 14.sp),
              ),
              SizedBox(height: 8.h),
              if (clubPlayers.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('No players found for this club.'),
                )
              else
                ...clubPlayers.map((player) => Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: Card(
                        child: InkWell(
                          onTap: () {
                            Get.to(() => PlayerDetailsScreen(player: player));
                          },
                          child: Padding(
                            padding: EdgeInsets.all(12.w),
                            child: Row(
                              children: [
                                Container(
                                  width: 40.w,
                                  height: 40.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: theme.colorScheme.primary,
                                      width: 1.w,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    player.name.isNotEmpty ? player.name.substring(0, 2).toUpperCase() : 'PL',
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w600,
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        player.name,
                                        style: textTheme.titleSmall?.copyWith(fontSize: 13.sp),
                                      ),
                                      SizedBox(height: 2.h),
                                      Text(
                                        '${player.registrationId} · ${player.role}',
                                        style: textTheme.bodySmall?.copyWith(fontSize: 11.sp),
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  size: 18.sp,
                                  color: theme.colorScheme.onSurfaceVariant,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
