import 'package:ccmd/features/tournaments/screens/tournament_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

class TournamentsScreen extends StatelessWidget {
  const TournamentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    const tournaments = [
      _Tournament(
        name: 'Dhaka Premier League 2026',
        dateRange: '12 Sep – 30 Oct 2026',
        clubs: '8 participating clubs',
        status: _TournamentStatus.ongoing,
      ),
      _Tournament(
        name: 'National T20 Cup',
        dateRange: '15 Nov – 10 Dec 2026',
        clubs: '6 participating clubs',
        status: _TournamentStatus.upcoming,
      ),
      _Tournament(
        name: 'Bangabandhu Cup 2025',
        dateRange: '1 Mar – 20 Apr 2025',
        clubs: '10 participating clubs',
        status: _TournamentStatus.completed,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Tournaments',
        ),
      ),

      body: SafeArea(
        top: false,
        child: ListView.separated(
          padding: EdgeInsets.fromLTRB(
            16.w,
            16.h,
            16.w,
            24.h,
          ),
          itemCount: tournaments.length,
          separatorBuilder: (_, __) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            return _TournamentCard(
              tournament: tournaments[index],
            );
          },
        ),
      ),

    );
  }
}

// =============================================================================
// TOURNAMENT CARD
// =============================================================================

class _TournamentCard extends StatelessWidget {
  final _Tournament tournament;

  const _TournamentCard({
    required this.tournament,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12.r),
        onTap: () {
          Get.to(
                () => const TournamentDetailsScreen(),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ----------------------------------------------------------------
              // TOURNAMENT LOGO
              // ----------------------------------------------------------------
              Container(
                width: 48.w,
                height: 48.w,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: theme.dividerColor,
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: EdgeInsets.all(5.w),
                  child: Image.network(
                    'https://liquipedia.net/commons/images/thumb/d/d8/Dhaka_Premier_Division_Cricket_League_2025-26_allmode.png/600px-Dhaka_Premier_Division_Cricket_League_2025-26_allmode.png',
                    fit: BoxFit.contain,
                    errorBuilder: (
                        context,
                        error,
                        stackTrace,
                        ) {
                      return Icon(
                        Icons.emoji_events_outlined,
                        size: 22.sp,
                        color: theme.colorScheme.primary,
                      );
                    },
                  ),
                ),
              ),

              SizedBox(width: 12.w),

              // ----------------------------------------------------------------
              // TOURNAMENT INFORMATION
              // ----------------------------------------------------------------
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tournament name + status
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            tournament.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.titleSmall?.copyWith(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        SizedBox(width: 6.w),

                        _TournamentStatusChip(
                          status: tournament.status,
                        ),
                      ],
                    ),

                    SizedBox(height: 7.h),

                    // Date
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          size: 13.sp,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),

                        SizedBox(width: 5.w),

                        Expanded(
                          child: Text(
                            tournament.dateRange,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.bodySmall?.copyWith(
                              fontSize: 11.5.sp,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 5.h),

                    // Clubs
                    Row(
                      children: [
                        Icon(
                          Icons.groups_outlined,
                          size: 14.sp,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),

                        SizedBox(width: 5.w),

                        Expanded(
                          child: Text(
                            tournament.clubs,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.bodySmall?.copyWith(
                              fontSize: 11.5.sp,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // ----------------------------------------------------------------
              // ARROW
              // ----------------------------------------------------------------
              SizedBox(width: 4.w),

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
  }
}

// =============================================================================
// STATUS CHIP
// =============================================================================

class _TournamentStatusChip extends StatelessWidget {
  final _TournamentStatus status;

  const _TournamentStatusChip({
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    late String label;
    late Color backgroundColor;
    late Color textColor;

    switch (status) {
      case _TournamentStatus.ongoing:
        label = 'Ongoing';
        backgroundColor = const Color(0xFFEAF5EF);
        textColor = const Color(0xFF0B6B3A);
        break;

      case _TournamentStatus.upcoming:
        label = 'Upcoming';
        backgroundColor = const Color(0xFFEEF4FF);
        textColor = const Color(0xFF315EA8);
        break;

      case _TournamentStatus.completed:
        label = 'Completed';
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
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}

// =============================================================================
// MODEL
// =============================================================================

enum _TournamentStatus {
  ongoing,
  upcoming,
  completed,
}

class _Tournament {
  final String name;
  final String dateRange;
  final String clubs;
  final _TournamentStatus status;

  const _Tournament({
    required this.name,
    required this.dateRange,
    required this.clubs,
    required this.status,
  });
}