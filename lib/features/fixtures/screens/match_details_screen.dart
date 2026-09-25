import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class MatchDetailsScreen extends StatelessWidget {
  const MatchDetailsScreen({super.key});

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
          'Match Details',
        ),
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
            // ---------------------------------------------------------------
            // TOURNAMENT
            // ---------------------------------------------------------------
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.w,
              ),
              child: Text(
                'Dhaka Premier League 2026',
                style: textTheme.bodySmall?.copyWith(
                  fontSize: 12.sp,
                ),
              ),
            ),

            SizedBox(height: 8.h),

            // ---------------------------------------------------------------
            // MATCH CARD
            // ---------------------------------------------------------------
            Card(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  14.w,
                  14.h,
                  14.w,
                  12.h,
                ),
                child: Column(
                  children: [
                    // -------------------------------------------------------
                    // TEAMS
                    // -------------------------------------------------------
                    Row(
                      crossAxisAlignment:
                      CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: _Team(
                            initials: 'AL',
                            name: 'Abahani',
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                          ),
                          child: Text(
                            'vs',
                            style: textTheme.bodySmall?.copyWith(
                              fontSize: 12.sp,
                            ),
                          ),
                        ),

                        Expanded(
                          child: _Team(
                            initials: 'MSC',
                            name: 'Mohammedan',
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16.h),

                    Divider(
                      height: 1,
                      color: theme.dividerColor,
                    ),

                    SizedBox(height: 8.h),

                    // -------------------------------------------------------
                    // MATCH INFORMATION
                    // -------------------------------------------------------
                    const _MatchInfoRow(
                      label: 'Date',
                      value: '28 Sep 2026',
                    ),

                    const _MatchInfoRow(
                      label: 'Start Time',
                      value: '2:00 PM',
                    ),

                    const _MatchInfoRow(
                      label: 'Venue',
                      value: 'Sher-e-Bangla Stadium',
                    ),

                    const _MatchInfoRow(
                      label: 'Umpires',
                      value: 'Nasir Uddin, Rafiq Islam',
                    ),

                    _MatchInfoRow(
                      label: 'Status',
                      valueWidget: _StatusChip(
                        label: 'Upcoming',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// TEAM
// =============================================================================

class _Team extends StatelessWidget {
  final String initials;
  final String name;

  const _Team({
    required this.initials,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Column(
      children: [
        Container(
          width: 44.w,
          height: 44.w,
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(7.r),
          ),
          alignment: Alignment.center,
          child: Text(
            initials,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),

        SizedBox(height: 5.h),

        Text(
          name,
          textAlign: TextAlign.center,
          style: textTheme.bodyMedium?.copyWith(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

// =============================================================================
// MATCH INFO ROW
// =============================================================================

class _MatchInfoRow extends StatelessWidget {
  final String label;
  final String? value;
  final Widget? valueWidget;

  const _MatchInfoRow({
    required this.label,
    this.value,
    this.valueWidget,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 4.h,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              label,
              style: textTheme.bodySmall?.copyWith(
                fontSize: 12.sp,
              ),
            ),
          ),

          SizedBox(width: 12.w),

          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.centerRight,
              child: valueWidget ??
                  Text(
                    value ?? '',
                    textAlign: TextAlign.right,
                    style: textTheme.bodySmall?.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface,
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// STATUS CHIP
// =============================================================================

class _StatusChip extends StatelessWidget {
  final String label;

  const _StatusChip({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 9.w,
        vertical: 4.h,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF4FF),
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF315EA8),
        ),
      ),
    );
  }
}