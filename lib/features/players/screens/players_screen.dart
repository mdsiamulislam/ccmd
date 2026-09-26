import 'package:ccmd/core/theme/app_colors.dart';
import 'package:ccmd/features/landing/controllers/landing_controller.dart';
import 'package:ccmd/features/players/screens/player_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

class PlayersScreen extends StatelessWidget {
  const PlayersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final landingController = Get.find<LandingController>();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Players'),
      ),
      body: SafeArea(
        top: false,
        child: Obx(() {
          if (landingController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          final players = landingController.players;

          if (players.isEmpty) {
            return const Center(child: Text('No players available.'));
          }

          return ListView.separated(
            padding: EdgeInsets.fromLTRB(
              16.w,
              16.h,
              16.w,
              24.h,
            ),
            itemCount: players.length + 1,
            separatorBuilder: (_, __) => SizedBox(height: 10.h),
            itemBuilder: (context, index) {
              if (index == 0) {
                return TextField(
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    hintText: 'Search players...',
                    prefixIcon: Icon(
                      Icons.search,
                      size: 20.sp,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                );
              }

              final player = players[index - 1];
              final club = landingController.clubs.firstWhereOrNull((c) => c.id == player.clubId);
              final clubName = club?.name ?? 'Unknown Club';
              final isForeign = player.playerType.toLowerCase() == 'foreign';
              final initials = player.name.isNotEmpty ? player.name.substring(0, 2).toUpperCase() : 'PL';

              return InkWell(
                onTap: () {
                  Get.to(() => PlayerDetailsScreen(player: player));
                },
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Row(
                      children: [
                        Container(
                          width: 48.w,
                          height: 48.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: theme.colorScheme.primary,
                              width: 1.5.w,
                            ),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            initials,
                            style: TextStyle(
                              fontSize: 13.sp,
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
                              Wrap(
                                spacing: 6.w,
                                runSpacing: 2.h,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Text(
                                    player.name,
                                    style: textTheme.titleSmall?.copyWith(
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  if (isForeign)
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 6.w,
                                        vertical: 2.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.primaryLight,
                                        borderRadius: BorderRadius.circular(100.r),
                                      ),
                                      child: Text(
                                        'Foreign',
                                        style: TextStyle(
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.w600,
                                          color: theme.colorScheme.primary,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                '${player.registrationId} · $clubName',
                                style: textTheme.bodySmall?.copyWith(
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          size: 20.sp,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
