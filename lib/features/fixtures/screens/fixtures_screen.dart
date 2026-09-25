import 'package:ccmd/features/fixtures/screens/match_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

class FixturesScreen extends StatefulWidget {
  const FixturesScreen({super.key});

  @override
  State<FixturesScreen> createState() => _FixturesScreenState();
}

class _FixturesScreenState extends State<FixturesScreen> {
  int selectedTab = 0;

  final List<_Fixture> upcomingFixtures = const [
    _Fixture(
      teamA: 'Abahani',
      teamB: 'Mohammedan',
      date: '28 Sep',
      time: '2:00 PM',
      venue: 'Sher-e-Bangla',
    ),
    _Fixture(
      teamA: 'Gazi Tigers',
      teamB: 'Sylhet Falcons',
      date: '30 Sep',
      time: '10:00 AM',
      venue: 'Fatullah',
    ),
    _Fixture(
      teamA: 'Victoria SC',
      teamB: 'Rupganj Tigers',
      date: '2 Oct',
      time: '2:00 PM',
      venue: 'Fatullah',
    ),
  ];

  final List<_Fixture> completedFixtures = const [
    _Fixture(
      teamA: 'Victoria SC',
      teamB: 'Brothers Union',
      date: '24 Sep',
      time: '2:00 PM',
      venue: 'Sher-e-Bangla',
      result: 'Victoria SC won by 6 wickets',
    ),
    _Fixture(
      teamA: 'Abahani',
      teamB: 'Gazi Tigers',
      date: '22 Sep',
      time: '2:00 PM',
      venue: 'Fatullah',
      result: 'Abahani won by 5 wickets',
    ),
    _Fixture(
      teamA: 'Mohammedan',
      teamB: 'Rupganj Tigers',
      date: '20 Sep',
      time: '10:00 AM',
      venue: 'Sher-e-Bangla',
      result: 'Mohammedan won by 32 runs',
    ),
  ];

  List<_Fixture> get currentFixtures {
    return selectedTab == 0
        ? upcomingFixtures
        : completedFixtures;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Fixtures & Results',
        ),
      ),

      body: SafeArea(
        top: false,
        child: Column(
          children: [
            // ------------------------------------------------------------------
            // TABS
            // ------------------------------------------------------------------
            Padding(
              padding: EdgeInsets.fromLTRB(
                20.w,
                14.h,
                20.w,
                0,
              ),
              child: Container(
                height: 34.h,
                padding: EdgeInsets.all(3.w),
                decoration: BoxDecoration(
                  color: const Color(0xFFEDF0F2),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    _TabButton(
                      label: 'Upcoming',
                      selected: selectedTab == 0,
                      onTap: () {
                        setState(() {
                          selectedTab = 0;
                        });
                      },
                    ),
                    _TabButton(
                      label: 'Completed',
                      selected: selectedTab == 1,
                      onTap: () {
                        setState(() {
                          selectedTab = 1;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16.h),

            // ------------------------------------------------------------------
            // FIXTURE LIST
            // ------------------------------------------------------------------
            Expanded(
              child: currentFixtures.isEmpty
                  ? _EmptyState(
                isCompleted: selectedTab == 1,
              )
                  : ListView.separated(
                padding: EdgeInsets.fromLTRB(
                  20.w,
                  0,
                  20.w,
                  24.h,
                ),
                itemCount: currentFixtures.length,
                separatorBuilder: (_, __) =>
                    SizedBox(height: 10.h),
                itemBuilder: (context, index) {
                  final fixture = currentFixtures[index];

                  return _FixtureCard(
                    fixture: fixture,
                    isCompleted: selectedTab == 1,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// TAB BUTTON
// =============================================================================

class _TabButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _TabButton({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOut,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected
                ? theme.colorScheme.surface
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: selected
                ? [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ]
                : null,
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: selected
                  ? FontWeight.w600
                  : FontWeight.w500,
              color: selected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// FIXTURE CARD
// =============================================================================

class _FixtureCard extends StatelessWidget {
  final _Fixture fixture;
  final bool isCompleted;

  const _FixtureCard({
    required this.fixture,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return InkWell(
      onTap: () {
        Get.to(() => const MatchDetailsScreen());
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${fixture.teamA} vs ${fixture.teamB}',
                      style: textTheme.bodyMedium?.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  SizedBox(width: 8.w),

                  _StatusChip(
                    label: isCompleted
                        ? 'Completed'
                        : 'Upcoming',
                    isCompleted: isCompleted,
                  ),
                ],
              ),

              SizedBox(height: 3.h),

              Text(
                '${fixture.date}, ${fixture.time} · ${fixture.venue}',
                style: textTheme.bodySmall?.copyWith(
                  fontSize: 12.sp,
                ),
              ),

              if (isCompleted && fixture.result != null) ...[
                SizedBox(height: 6.h),

                Text(
                  fixture.result!,
                  style: textTheme.bodySmall?.copyWith(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
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

class _StatusChip extends StatelessWidget {
  final String label;
  final bool isCompleted;

  const _StatusChip({
    required this.label,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final backgroundColor = isCompleted
        ? const Color(0xFFF0F2F4)
        : const Color(0xFFEEF4FF);

    final textColor = isCompleted
        ? const Color(0xFF56616B)
        : const Color(0xFF315EA8);

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
// EMPTY STATE
// =============================================================================

class _EmptyState extends StatelessWidget {
  final bool isCompleted;

  const _EmptyState({
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.sports_cricket_outlined,
              size: 40.sp,
              color: theme.colorScheme.onSurfaceVariant,
            ),

            SizedBox(height: 12.h),

            Text(
              isCompleted
                  ? 'No completed matches'
                  : 'No upcoming matches',
              style: textTheme.titleSmall?.copyWith(
                fontSize: 16.sp,
              ),
            ),

            SizedBox(height: 4.h),

            Text(
              isCompleted
                  ? 'Completed matches will appear here.'
                  : 'Scheduled matches will appear here.',
              textAlign: TextAlign.center,
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
// FIXTURE MODEL
// =============================================================================

class _Fixture {
  final String teamA;
  final String teamB;
  final String date;
  final String time;
  final String venue;
  final String? result;

  const _Fixture({
    required this.teamA,
    required this.teamB,
    required this.date,
    required this.time,
    required this.venue,
    this.result,
  });
}