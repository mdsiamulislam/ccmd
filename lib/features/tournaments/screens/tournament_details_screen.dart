import 'package:ccmd/core/theme/app_colors.dart';
import 'package:ccmd/core/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../../players/screens/player_details_screen.dart';

class TournamentDetailsScreen extends StatefulWidget {
  const TournamentDetailsScreen({super.key});

  @override
  State<TournamentDetailsScreen> createState() =>
      _TournamentDetailsScreenState();
}

class _TournamentDetailsScreenState
    extends State<TournamentDetailsScreen> {
  int selectedTab = 0;

  final List<String> tabs = const [
    'Overview',
    'Fixtures',
    'Players',
    'Umpires',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            size: 22.sp,
          ),
        ),
        title: Text(
          'Tournament Details',
        ),
      ),

      body: Column(
        children: [
          // --------------------------------------------------------------------
          // TABS
          // --------------------------------------------------------------------
          Container(
            height: 48.h,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFFEDF0F2),
                ),
              ),
            ),
            child: Row(
              children: List.generate(
                tabs.length,
                    (index) {
                  final selected = selectedTab == index;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = index;
                        });
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                tabs[index],
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: selected
                                      ? FontWeight.w600
                                      : FontWeight.w500,
                                  color: selected
                                      ? theme.colorScheme.primary
                                      : theme
                                      .colorScheme
                                      .onSurfaceVariant,
                                ),
                              ),
                            ),
                          ),

                          AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            height: 2.h,
                            width: 54.w,
                            color: selected
                                ? theme.colorScheme.primary
                                : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // --------------------------------------------------------------------
          // TAB CONTENT
          // --------------------------------------------------------------------
          Expanded(
            child: IndexedStack(
              index: selectedTab,
              children: const [
                _OverviewTab(),
                _FixturesTab(),
                _PlayersTab(),
                _UmpiresTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _UmpiresTab extends StatelessWidget {
  const _UmpiresTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(
        16.w,
        14.h,
        16.w,
        24.h,
      ),
      children: const [
        _UmpireItem(
          imageUrl:
          'https://static.wixstatic.com/media/a18038_ead2d35493b64d2eb97db12570b9759c~mv2.jpg/v1/fill/w_280,h_280,q_90,enc_avif,quality_auto/a18038_ead2d35493b64d2eb97db12570b9759c~mv2.jpg',
          name: 'Nasir Uddin',
          role: 'International Umpire',
          phone: '+880 1712-345678',
          email: 'nasir.uddin@ccmd.gov.bd',
          matches: '4 assigned matches',
        ),

        _UmpireItem(
          initials: 'RA',
          name: 'Rafiqul Alam',
          role: 'National Umpire',
          phone: '+880 1812-456789',
          email: 'rafiqul.alam@ccmd.gov.bd',
          matches: '3 assigned matches',
        ),

        _UmpireItem(
          initials: 'KH',
          name: 'Kamrul Hasan',
          role: 'National Umpire',
          phone: '+880 1912-567890',
          email: 'kamrul.hasan@ccmd.gov.bd',
          matches: '3 assigned matches',
        ),
      ],
    );
  }
}


class _UmpireItem extends StatelessWidget {
  final String? imageUrl;
  final String? initials;
  final String name;
  final String role;
  final String phone;
  final String email;
  final String matches;

  const _UmpireItem({
    this.imageUrl,
    this.initials,
    required this.name,
    required this.role,
    required this.phone,
    required this.email,
    required this.matches,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Card(
      margin: EdgeInsets.only(bottom: 10.h),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          children: [
            // Profile
            Row(
              children: [
                Container(
                  width: 52.w,
                  height: 52.w,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: theme.dividerColor,
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: imageUrl != null
                      ? Image.network(
                    imageUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (
                        context,
                        error,
                        stackTrace,
                        ) {
                      return Center(
                        child: Text(
                          initials ?? '?',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      );
                    },
                  )
                      : Center(
                    child: Text(
                      initials ?? '?',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 12.w),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.titleSmall?.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      SizedBox(height: 3.h),

                      Text(
                        role,
                        style: textTheme.bodySmall?.copyWith(
                          fontSize: 11.sp,
                        ),
                      ),

                      SizedBox(height: 4.h),

                      Row(
                        children: [
                          Icon(
                            Icons.assignment_outlined,
                            size: 13.sp,
                            color: theme.colorScheme.primary,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            matches,
                            style: textTheme.bodySmall?.copyWith(
                              fontSize: 11.sp,
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 12.h),

            Divider(
              height: 1,
              color: theme.dividerColor,
            ),

            SizedBox(height: 10.h),

            // Phone
            _ContactRow(
              icon: Icons.phone_outlined,
              text: phone,
            ),

            SizedBox(height: 7.h),

            // Email
            _ContactRow(
              icon: Icons.email_outlined,
              text: email,
            ),

            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ContactRow({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () async {
        await Clipboard.setData(ClipboardData(text: text));
        AppSnackbar.info('Copied to clipboard');

      },
      child: Row(
        children: [
          Icon(
            icon,
            size: 16.sp,
            color: theme.colorScheme.onSurfaceVariant,
          ),

          SizedBox(width: 8.w),

          Expanded(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VenuesScreen extends StatelessWidget {
  const VenuesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Venues',
          style: textTheme.titleLarge?.copyWith(
            fontSize: 18.sp,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
          16.w,
          14.h,
          16.w,
          24.h,
        ),
        children: const [
          _VenueCard(
            name: 'Sher-e-Bangla National Stadium',
            location: 'Mirpur, Dhaka',
            capacity: '25,000',
            matches: '12',
            available: true,
            floodlights: true,
            practiceNets: true,
          ),

          _VenueCard(
            name: 'Fatullah Cricket Ground',
            location: 'Narayanganj',
            capacity: '15,000',
            matches: '8',
            available: true,
            floodlights: true,
            practiceNets: true,
          ),

          _VenueCard(
            name: 'Bangladesh Krira Shikkha Protisthan',
            location: 'Savar, Dhaka',
            capacity: '8,000',
            matches: '5',
            available: false,
            floodlights: true,
            practiceNets: true,
          ),
        ],
      ),
    );
  }
}

class _VenueCard extends StatelessWidget {
  final String name;
  final String location;
  final String capacity;
  final String matches;
  final bool available;
  final bool floodlights;
  final bool practiceNets;

  const _VenueCard({
    required this.name,
    required this.location,
    required this.capacity,
    required this.matches,
    required this.available,
    required this.floodlights,
    required this.practiceNets,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Card(
      margin: EdgeInsets.only(bottom: 12.h),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.r),
        onTap: () {
          // TODO: Open venue details
        },
        child: Padding(
          padding: EdgeInsets.all(14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // -------------------------------------------------------------
              // VENUE HEADER
              // -------------------------------------------------------------
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.titleSmall?.copyWith(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        SizedBox(height: 4.h),

                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 14.sp,
                              color: theme
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),

                            SizedBox(width: 4.w),

                            Expanded(
                              child: Text(
                                location,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.bodySmall?.copyWith(
                                  fontSize: 11.5.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 8.w),

                  _AvailabilityChip(
                    available: available,
                  ),
                ],
              ),

              SizedBox(height: 14.h),

              Divider(
                height: 1,
                color: theme.dividerColor,
              ),

              SizedBox(height: 12.h),

              // -------------------------------------------------------------
              // BASIC INFORMATION
              // -------------------------------------------------------------
              Row(
                children: [
                  Expanded(
                    child: _InfoItem(
                      icon: Icons.people_outline,
                      label: 'Capacity',
                      value: capacity,
                    ),
                  ),

                  Container(
                    width: 1,
                    height: 34.h,
                    color: theme.dividerColor,
                  ),

                  Expanded(
                    child: _InfoItem(
                      icon: Icons.sports_cricket_outlined,
                      label: 'Matches',
                      value: matches,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12.h),

              // -------------------------------------------------------------
              // FACILITIES
              // -------------------------------------------------------------
              Wrap(
                spacing: 8.w,
                runSpacing: 6.h,
                children: [
                  if (floodlights)
                    const _FacilityChip(
                      icon: Icons.lightbulb_outline,
                      label: 'Floodlights',
                    ),

                  if (practiceNets)
                    const _FacilityChip(
                      icon: Icons.sports_cricket_outlined,
                      label: 'Practice Nets',
                    ),
                ],
              ),

              SizedBox(height: 12.h),

              // -------------------------------------------------------------
              // VIEW DETAILS
              // -------------------------------------------------------------
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'View details',
                      style: TextStyle(
                        fontSize: 11.5.sp,
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.primary,
                      ),
                    ),

                    SizedBox(width: 2.w),

                    Icon(
                      Icons.chevron_right,
                      size: 18.sp,
                      color: theme.colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AvailabilityChip extends StatelessWidget {
  final bool available;

  const _AvailabilityChip({
    required this.available,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final backgroundColor = available
        ? AppColors.primaryLight
        : theme.colorScheme.errorContainer;

    final textColor = available
        ? theme.colorScheme.primary
        : theme.colorScheme.error;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 4.h,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 5.w,
            height: 5.w,
            decoration: BoxDecoration(
              color: textColor,
              shape: BoxShape.circle,
            ),
          ),

          SizedBox(width: 5.w),

          Text(
            available ? 'Available' : 'Unavailable',
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        SizedBox(width: 8.w),

        Icon(
          icon,
          size: 17.sp,
          color: theme.colorScheme.onSurfaceVariant,
        ),

        SizedBox(width: 7.w),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: 10.sp,
              ),
            ),

            SizedBox(height: 1.h),

            Text(
              value,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _FacilityChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _FacilityChip({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 5.h,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 13.sp,
            color: theme.colorScheme.onSurfaceVariant,
          ),

          SizedBox(width: 5.w),

          Text(
            label,
            style: TextStyle(
              fontSize: 10.sp,
              color: theme.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}



// =============================================================================
// OVERVIEW TAB
// =============================================================================

class _OverviewTab extends StatelessWidget {
  const _OverviewTab();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return ListView(
      padding: EdgeInsets.fromLTRB(
        16.w,
        14.h,
        16.w,
        24.h,
      ),
      children: [
        // Tournament header
        Text(
          'Dhaka Premier League 2026',
          style: textTheme.titleLarge?.copyWith(
            fontSize: 20.sp,
          ),
        ),

        SizedBox(height: 4.h),

        Row(
          children: [
            _StatusChip(
              label: 'Ongoing',
              backgroundColor: theme.colorScheme.primaryContainer,
              textColor: AppColors.primaryLight
            ),

            SizedBox(width: 8.w),

            Text(
              '12 Sep – 30 Oct 2026',
              style: textTheme.bodySmall?.copyWith(
                fontSize: 12.sp,
              ),
            ),
          ],
        ),

        SizedBox(height: 14.h),

        // Statistics
        GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
          childAspectRatio: 1.8,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            _StatCard(
              value: '8',
              label: 'Clubs',
            ),
            _StatCard(
              value: '64',
              label: 'Players',
            ),
            _StatCard(
              value: '28',
              label: 'Matches',
            ),
            _StatCard(
              value: '2',
              label: 'Venues',
            ),
          ],
        ),

        SizedBox(height: 18.h),

        // Opening match
        _SectionTitle(title: 'OPENING MATCH'),

        SizedBox(height: 6.h),

        const _OpeningMatchCard(),

        SizedBox(height: 16.h),

        // Participating clubs
        _SectionTitle(title: 'PARTICIPATING CLUBS'),

        SizedBox(height: 6.h),

        const _ClubList(),

        SizedBox(height: 16.h),
        _SectionTitle(title: 'VENUES'),
        SizedBox(height: 6.h),
        const _VenueCard(
          name: 'Sher-e-Bangla National Stadium',
          location: 'Mirpur, Dhaka',
          capacity: '25,000',
          matches: '12',
          available: true,
          floodlights: true,
          practiceNets: true,
        ),
      ],
    );
  }
}

// =============================================================================
// FIXTURES TAB
// =============================================================================

class _FixturesTab extends StatelessWidget {
  const _FixturesTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(
        16.w,
        14.h,
        16.w,
        24.h,
      ),
      children: const [
        _FixtureItem(
          teamA: 'Abahani Limited',
          teamB: 'Mohammedan SC',
          date: '12 Sep',
          time: '9:30 AM',
          venue: 'Sher-e-Bangla National Stadium',
          status: 'Completed',
        ),
        _FixtureItem(
          teamA: 'Victoria SC',
          teamB: 'Rupganj Tigers',
          date: '14 Sep',
          time: '2:00 PM',
          venue: 'Fatullah',
          status: 'Completed',
        ),
        _FixtureItem(
          teamA: 'Abahani Limited',
          teamB: 'Victoria SC',
          date: '28 Sep',
          time: '2:00 PM',
          venue: 'Sher-e-Bangla National Stadium',
          status: 'Upcoming',
        ),
        _FixtureItem(
          teamA: 'Mohammedan SC',
          teamB: 'Rupganj Tigers',
          date: '30 Sep',
          time: '10:00 AM',
          venue: 'Fatullah',
          status: 'Upcoming',
        ),
      ],
    );
  }
}

// =============================================================================
// PLAYERS TAB
// =============================================================================

class _PlayersTab extends StatelessWidget {
  const _PlayersTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(
        16.w,
        14.h,
        16.w,
        24.h,
      ),
      children: const [
        _PlayerItem(
          initials: 'https://img1.hscicdn.com/image/upload/f_auto,t_ds_square_w_320,q_50/lsci/db/PICTURES/CMS/319700/319734.3.png',
          name: 'Mustafizur Rahman',
          registrationId: 'REG-1042',
          club: 'Abahani Limited',
        ),
        _PlayerItem(
          initials: 'https://img1.hscicdn.com/image/upload/f_auto,t_ds_square_w_320,q_50/lsci/db/PICTURES/CMS/385700/385792.1.png',
          name: 'Tamim Iqbal',
          registrationId: 'REG-1088',
          club: 'Mohammedan SC',
          isForeign: true,
        ),
        _PlayerItem(
          initials: 'SK',
          name: 'Shakib Khan',
          registrationId: 'REG-1015',
          club: 'Victoria SC',
        ),
        _PlayerItem(
          initials: 'RM',
          name: 'Rahim Mahmud',
          registrationId: 'REG-1120',
          club: 'Rupganj Tigers',
        ),
      ],
    );
  }
}

// =============================================================================
// UMPIRES TAB
// =============================================================================



// =============================================================================
// OPENING MATCH
// =============================================================================

class _OpeningMatchCard extends StatelessWidget {
  const _OpeningMatchCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: theme.colorScheme.primary,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'OPENING MATCH',
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.primary,
            ),
          ),

          SizedBox(height: 6.h),

          Row(
            children: [
              Expanded(
                child: Text(
                  'Abahani Limited',
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Text(
                'vs',
                style: textTheme.bodySmall?.copyWith(
                  fontSize: 12.sp,
                ),
              ),

              Expanded(
                child: Text(
                  'Mohammedan SC',
                  textAlign: TextAlign.right,
                  style: textTheme.bodyMedium?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 6.h),

          Text(
            '12 Sep, 9:30 AM · Sher-e-Bangla National Stadium',
            style: textTheme.bodySmall?.copyWith(
              fontSize: 12.sp,
            ),
          ),

          SizedBox(height: 3.h),

          Text(
            'Umpire: Nasir Uddin',
            style: textTheme.bodySmall?.copyWith(
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// CLUB LIST
// =============================================================================

class _ClubList extends StatelessWidget {
  const _ClubList();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: const [
          _ClubItem(
            clubLogoUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbumTk6VdXnk1629ZgD29GDoXKklLSrXnPr11aXvXxYA&s',
            name: 'Abahani Limited',
          ),
          _ClubItem(
            clubLogoUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbumTk6VdXnk1629ZgD29GDoXKklLSrXnPr11aXvXxYA&s',
            name: 'Mohammedan SC',
          ),
          _ClubItem(
            clubLogoUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbumTk6VdXnk1629ZgD29GDoXKklLSrXnPr11aXvXxYA&s',
            name: 'Victoria SC',
          ),
          _ClubItem(
            clubLogoUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbumTk6VdXnk1629ZgD29GDoXKklLSrXnPr11aXvXxYA&s',
            name: 'Rupganj Tigers',
          ),
        ],
      ),
    );
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
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: textTheme.titleLarge?.copyWith(
                fontSize: 22.sp,
              ),
            ),
            SizedBox(height: 2.h),
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
// SECTION TITLE
// =============================================================================

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 11.sp,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        letterSpacing: 0.3,
      ),
    );
  }
}

// =============================================================================
// FIXTURE ITEM
// =============================================================================

class _FixtureItem extends StatelessWidget {
  final String teamA;
  final String teamB;
  final String date;
  final String time;
  final String venue;
  final String status;

  const _FixtureItem({
    required this.teamA,
    required this.teamB,
    required this.date,
    required this.time,
    required this.venue,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final completed = status == 'Completed';

    return Card(
      margin: EdgeInsets.only(bottom: 10.h),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    '$teamA vs $teamB',
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                _StatusChip(
                  label: status,
                  backgroundColor: completed
                      ? const Color(0xFFF0F2F4)
                      : const Color(0xFFEEF4FF),
                  textColor: completed
                      ? const Color(0xFF56616B)
                      : const Color(0xFF315EA8),
                ),
              ],
            ),
            SizedBox(height: 4.h),
            Text(
              '$date, $time · $venue',
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
// PLAYER ITEM
// =============================================================================

class _PlayerItem extends StatelessWidget {
  final String initials;
  final String name;
  final String registrationId;
  final String club;
  final bool isForeign;

  const _PlayerItem({
    required this.initials,
    required this.name,
    required this.registrationId,
    required this.club,
    this.isForeign = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return InkWell(
      onTap: () {
        Get.to(() => const PlayerDetailsScreen());
      },
      child: Card(
        margin: EdgeInsets.only(bottom: 10.h),
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Row(
            children: [
              Container(
                width: 46.w,
                height: 46.w,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: theme.colorScheme.primaryContainer,
                  ),
                  shape: BoxShape.circle,

                ),
                alignment: Alignment.center,
                child:Image.network(
                  initials,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Text(
                      initials,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.primary,
                      ),
                    );
                  }
                )
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 6.w,
                      children: [
                        Text(
                          name,
                          style: textTheme.titleSmall?.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                        if (isForeign)
                          _StatusChip(
                            label: 'Foreign',
                            backgroundColor:AppColors.primaryLight,
                            textColor: theme.colorScheme.primary,
                          ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      '$registrationId · $club',
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
  }
}

// =============================================================================
// UMPIRE ITEM
// =============================================================================



// =============================================================================
// CLUB ITEM
// =============================================================================

class _ClubItem extends StatelessWidget {
  final String name;
  final String clubLogoUrl;

  const _ClubItem({
    required this.name,
    required this.clubLogoUrl,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 8.h,
        ),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFEDF0F2),
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 32.w,
              height: 32.w,
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Image.network(
                clubLogoUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Text(
                    '${name[0]}',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.primary,
                    ),
                  );
                },
              )
            ),

            SizedBox(width: 12.w),

            Text(
              name,
              style: textTheme.bodyMedium?.copyWith(
                fontSize: 14.sp,
              ),
            ),
          ],
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
  final Color backgroundColor;
  final Color textColor;

  const _StatusChip({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
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