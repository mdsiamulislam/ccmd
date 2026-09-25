import 'package:ccmd/core/theme/app_colors.dart';
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

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Players'),
      ),

      body: SafeArea(
        top: false,
        child: ListView(
          padding: EdgeInsets.fromLTRB(
            16.w,
            16.h,
            16.w,
            24.h,
          ),
          children: [
            // ------------------------------------------------------------------
            // SEARCH
            // ------------------------------------------------------------------
            TextField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: 'Search players...',
                prefixIcon: Icon(
                  Icons.search,
                  size: 20.sp,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),

            SizedBox(height: 12.h),

            // ------------------------------------------------------------------
            // PLAYERS
            // ------------------------------------------------------------------
            const _PlayerCard(
              initials: 'MR',
              name: 'Mustafizur Rahman',
              registrationId: 'REG-1042',
              club: 'Abahani Limited',
            ),

            SizedBox(height: 10.h),

            const _PlayerCard(
              initials: 'TI',
              name: 'Tamim Iqbal',
              registrationId: 'REG-1088',
              club: 'Mohammedan SC',
              isForeign: true,
            ),

            SizedBox(height: 10.h),

            const _PlayerCard(
              initials: 'SK',
              name: 'Shakib Khan',
              registrationId: 'REG-1015',
              club: 'Victoria SC',
            ),
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// PLAYER CARD
// =============================================================================

class _PlayerCard extends StatelessWidget {
  final String initials;
  final String name;
  final String registrationId;
  final String club;
  final bool isForeign;

  const _PlayerCard({
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
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Row(
            children: [
              // ----------------------------------------------------------------
              // PLAYER AVATAR
              // ----------------------------------------------------------------
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

              // ----------------------------------------------------------------
              // PLAYER INFORMATION
              // ----------------------------------------------------------------
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name + foreign status
                    Wrap(
                      spacing: 6.w,
                      runSpacing: 2.h,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          name,
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
                      '$registrationId · $club',
                      style: textTheme.bodySmall?.copyWith(
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),

              // ----------------------------------------------------------------
              // DETAILS
              // ----------------------------------------------------------------
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