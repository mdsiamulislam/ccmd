import 'package:ccmd/core/theme/app_colors.dart';
import 'package:ccmd/features/fixtures/screens/match_details_screen.dart';
import 'package:ccmd/features/landing/controllers/landing_controller.dart';
import 'package:ccmd/features/tournaments/screens/tournament_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import 'package:ccmd/core/models/club_model.dart';
import 'package:ccmd/core/models/match_model.dart';
import 'package:ccmd/features/clubs/screens/clubs_screen.dart';
import 'package:ccmd/features/umpires/screens/umpires_screen.dart';
import 'package:ccmd/features/venues/screens/venues_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final landingController = Get.find<LandingController>();

    return Scaffold(
      body: Obx(() {
        if (landingController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return SafeArea(
          top: false,
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
              16.w,
              40.h,
              16.w,
              24.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Good morning',
                  style: textTheme.bodySmall?.copyWith(
                    fontSize: 12.sp,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  'BCB Administrator',
                  style: textTheme.titleSmall?.copyWith(
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 16.h),
                const _TournamentCard(),
                SizedBox(height: 20.h),
                const _SectionTitle(title: 'QUICK ACCESS'),
                SizedBox(height: 8.h),
                Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 10.h,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: _QuickAccessItem(
                            icon: Icons.groups_outlined,
                            title: 'Clubs',
                            onTap: () {
                              Get.to(() => const ClubsScreen());
                            },
                          ),
                        ),
                        _QuickAccessDivider(),
                        Expanded(
                          child: _QuickAccessItem(
                            icon: Icons.location_on_outlined,
                            title: 'Venues',
                            onTap: () {
                              Get.to(() => const VenuesListScreen());
                            },
                          ),
                        ),
                        _QuickAccessDivider(),
                        Expanded(
                          child: _QuickAccessItem(
                            icon: Icons.sports_outlined,
                            title: 'Umpires',
                            onTap: () {
                              Get.to(() => const UmpiresScreen());
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 10.h,
                  childAspectRatio: 1.9,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _StatCard(
                      value: landingController.players.length.toString(),
                      label: 'Players',
                    ),
                    _StatCard(
                      value: landingController.clubs.length.toString(),
                      label: 'Clubs',
                    ),
                    _StatCard(
                      value: landingController.venues.length.toString(),
                      label: 'Venues',
                    ),
                    _StatCard(
                      value: landingController.umpires.length.toString(),
                      label: 'Umpires',
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                _SectionHeader(
                  title: 'UPCOMING MATCHES',
                  action: 'View All',
                  onPressed: () {
                    landingController.curent_index.value = 2;
                  },
                ),
                SizedBox(height: 8.h),
                ...landingController.matches
                    .where((m) => m.status == 'Upcoming')
                    .take(2)
                    .map((m) {
                  final clubA = landingController.clubs.firstWhere((c) => c.id == m.clubAId);
                  final clubB = landingController.clubs.firstWhere((c) => c.id == m.clubBId);
                  final venue = landingController.venues.firstWhere((v) => v.id == m.venueId);
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: _MatchCard(
                      teamA: clubA.name,
                      teamB: clubB.name,
                      date: m.date,
                      time: m.time,
                      venue: venue.name,
                    ),
                  );
                }),
                SizedBox(height: 10.h),
                _SectionHeader(
                  title: 'RECENT RESULTS',
                  action: 'View All',
                  onPressed: () {
                    landingController.curent_index.value = 2;
                  },
                ),
                SizedBox(height: 8.h),
                ...landingController.matches
                    .where((m) => m.status == 'Completed')
                    .take(1)
                    .map((m) {
                  final clubA = landingController.clubs.firstWhere((c) => c.id == m.clubAId);
                  final clubB = landingController.clubs.firstWhere((c) => c.id == m.clubBId);
                  return _ResultCard(
                    match: m,
                    clubA: clubA,
                    clubB: clubB,
                  );
                }),
                SizedBox(height: 8.h),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Text(
      title,
      style: TextStyle(
        fontSize: 11.sp,
        fontWeight: FontWeight.w600,
        color: theme.colorScheme.onSurfaceVariant,
        letterSpacing: 0.3,
      ),
    );
  }
}

class _QuickAccessItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _QuickAccessItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 6.h,
          horizontal: 4.w,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 38.w,
              height: 38.w,
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 19.sp,
                color: theme.colorScheme.primary,
              ),
            ),

            SizedBox(height: 6.h),

            Text(
              title,
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _QuickAccessDivider extends StatelessWidget {
  const _QuickAccessDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 42.h,
      color: Theme.of(context).dividerColor,
    );
  }
}

// =============================================================================
// TOURNAMENT CARD
// =============================================================================

class _TournamentCard extends StatelessWidget {
  const _TournamentCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final landingController = Get.find<LandingController>();

    return Obx(() {
      if (landingController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      final tournament = landingController.activeTournament.value;
      if (tournament == null) {
        return const SizedBox.shrink();
      }

      return Card(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      tournament.name,
                      style: textTheme.titleSmall?.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                  ),

                  SizedBox(width: 8.w),

                  const _StatusChip(
                    label: 'Ongoing',
                    type: _StatusType.ongoing,
                  ),
                ],
              ),

              SizedBox(height: 4.h),

              Text(
                '${tournament.startDate} – ${tournament.endDate} · ${tournament.totalClubs} Clubs',
                style: textTheme.bodySmall?.copyWith(
                  fontSize: 12.sp,
                ),
              ),

              SizedBox(height: 14.h),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Get.to(()=> TournamentDetailsScreen());
                  },
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'View Tournament ›',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

// =============================================================================
// STAT CARD
// =============================================================================

class _StatCard extends StatelessWidget {
  final String value;
  final String label;

  const _StatCard({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: textTheme.titleLarge?.copyWith(
                fontSize: 22.sp,
                height: 1,
              ),
            ),

            SizedBox(height: 4.h),

            Text(
              label,
              style: textTheme.bodySmall?.copyWith(
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// SECTION HEADER
// =============================================================================

class _SectionHeader extends StatelessWidget {
  final String title;
  final String? action;
  final VoidCallback? onPressed;

  const _SectionHeader({
    required this.title,
    this.action,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurfaceVariant,
              letterSpacing: 0.3,
            ),
          ),
        ),

        if (action != null)
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
                vertical: 2.h,
              ),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              action!,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }
}

// =============================================================================
// MATCH CARD
// =============================================================================

class _MatchCard extends StatelessWidget {
  final String teamA;
  final String teamB;
  final String date;
  final String time;
  final String venue;

  const _MatchCard({
    required this.teamA,
    required this.teamB,
    required this.date,
    required this.time,
    required this.venue,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return InkWell(
      onTap: () {
        Get.to(()=> MatchDetailsScreen());
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$teamA vs $teamB',
                      style: textTheme.bodyMedium?.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(height: 3.h),

                    Text(
                      '$date, $time · $venue',
                      style: textTheme.bodySmall?.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 8.w),

              const _StatusChip(
                label: 'Upcoming',
                type: _StatusType.upcoming,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// RESULT CARD
// =============================================================================

class _ResultCard extends StatelessWidget {
  final Match match;
  final Club clubA;
  final Club clubB;

  const _ResultCard({
    required this.match,
    required this.clubA,
    required this.clubB,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        Get.to(() => MatchDetailsScreen());
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${clubA.name} vs ${clubB.name}',
                      style: textTheme.bodyMedium?.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      match.result?.summary ?? 'Result not available',
                      style: textTheme.bodySmall?.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              const _StatusChip(
                label: 'Completed',
                type: _StatusType.completed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// STATUS CHIP
// =============================================================================

enum _StatusType {
  ongoing,
  upcoming,
  completed,
}

class _StatusChip extends StatelessWidget {
  final String label;
  final _StatusType type;

  const _StatusChip({
    required this.label,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    late Color backgroundColor;
    late Color textColor;

    switch (type) {
      case _StatusType.ongoing:
        backgroundColor = const Color(0xFFEAF5EF);
        textColor = const Color(0xFF0B6B3A);
        break;

      case _StatusType.upcoming:
        backgroundColor = const Color(0xFFEEF4FF);
        textColor = const Color(0xFF315EA8);
        break;

      case _StatusType.completed:
        backgroundColor = const Color(0xFFF0F2F4);
        textColor = const Color(0xFF56616B);
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 9.w,
        vertical: 4.h,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10.sp,
          height: 1.2,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}