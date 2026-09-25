import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class PlayerDetailsScreen extends StatelessWidget {
  const PlayerDetailsScreen({super.key});

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
              // ----------------------------------------------------------------
              // PLAYER HEADER
              // ----------------------------------------------------------------
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
                      'MR',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),

                  SizedBox(height: 8.h),

                  Text(
                    'Mustafizur Rahman',
                    textAlign: TextAlign.center,
                    style: textTheme.titleLarge?.copyWith(
                      fontSize: 20.sp,
                    ),
                  ),

                  SizedBox(height: 2.h),

                  Text(
                    'Abahani Limited · Local Player',
                    textAlign: TextAlign.center,
                    style: textTheme.bodySmall?.copyWith(
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              // ----------------------------------------------------------------
              // PLAYER INFORMATION
              // ----------------------------------------------------------------
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
                        value: 'REG-1042',
                      ),
                      _InfoRow(
                        label: 'Date of Birth',
                        value: '6 Sep 1995',
                      ),
                      _InfoRow(
                        label: 'Nationality',
                        value: 'Bangladeshi',
                      ),
                      _InfoRow(
                        label: 'Club',
                        value: 'Abahani Limited',
                      ),
                      _InfoRow(
                        label: 'Player Type',
                        value: 'Bowler',
                      ),
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

// =============================================================================
// INFORMATION ROW
// =============================================================================

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