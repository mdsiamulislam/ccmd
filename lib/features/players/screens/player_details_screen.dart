import 'package:ccmd/core/models/player_model.dart';
import 'package:ccmd/features/landing/controllers/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

class PlayerDetailsScreen extends StatelessWidget {
  final Player? player;

  const PlayerDetailsScreen({super.key, this.player});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final landingController = Get.find<LandingController>();

    final p = player ?? (landingController.players.isNotEmpty ? landingController.players.first : null);

    final club = p != null ? landingController.clubs.firstWhereOrNull((c) => c.id == p.clubId) : null;
    final clubName = club?.name ?? 'Unknown Club';
    final initials = p != null && p.name.isNotEmpty ? p.name.substring(0, 2).toUpperCase() : 'MR';
    final playerName = p?.name ?? 'Mustafizur Rahman';
    final regId = p?.registrationId ?? 'REG-1042';
    final dob = p?.dateOfBirth ?? '6 Sep 1995';
    final nationality = p?.nationality ?? 'Bangladeshi';
    final playerType = p?.playerType ?? 'Bowler';

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
          'Player Details',
          style: textTheme.titleLarge?.copyWith(
            fontSize: 18.sp,
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            16.w,
            18.h,
            16.w,
            24.h,
          ),
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
                      initials,
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    playerName,
                    textAlign: TextAlign.center,
                    style: textTheme.titleLarge?.copyWith(
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '$clubName · $playerType Player',
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
                    children: [
                      _InfoRow(
                        label: 'Registration ID',
                        value: regId,
                      ),
                      _InfoRow(
                        label: 'Date of Birth',
                        value: dob,
                      ),
                      _InfoRow(
                        label: 'Nationality',
                        value: nationality,
                      ),
                      _InfoRow(
                        label: 'Club',
                        value: clubName,
                      ),
                      _InfoRow(
                        label: 'Player Type',
                        value: playerType,
                      ),
                      if (p != null) ...[
                        _InfoRow(
                          label: 'Role',
                          value: p.role,
                        ),
                        _InfoRow(
                          label: 'Batting Style',
                          value: p.battingStyle,
                        ),
                        _InfoRow(
                          label: 'Bowling Style',
                          value: p.bowlingStyle,
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({
    required this.label,
    required this.value,
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
            child: Text(
              label,
              style: textTheme.bodySmall?.copyWith(
                fontSize: 12.sp,
              ),
            ),
          ),
          SizedBox(width: 16.w),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: textTheme.bodySmall?.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
