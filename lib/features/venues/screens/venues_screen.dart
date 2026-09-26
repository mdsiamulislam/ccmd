import 'package:ccmd/features/landing/controllers/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

class VenuesListScreen extends StatelessWidget {
  const VenuesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final landingController = Get.find<LandingController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Venues & Grounds'),
      ),
      body: SafeArea(
        top: false,
        child: Obx(() {
          if (landingController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          final venues = landingController.venues;

          if (venues.isEmpty) {
            return const Center(child: Text('No venues available.'));
          }

          return ListView.separated(
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
            itemCount: venues.length,
            separatorBuilder: (_, __) => SizedBox(height: 10.h),
            itemBuilder: (context, index) {
              final venue = venues[index];
              final isAvailable = venue.status.toLowerCase() == 'available';

              final upcomingMatch = landingController.matches.firstWhereOrNull(
                (m) => m.venueId == venue.id && m.status == 'Upcoming',
              );

              return Card(
                child: Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              venue.name,
                              style: textTheme.titleSmall?.copyWith(
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 3.h,
                            ),
                            decoration: BoxDecoration(
                              color: isAvailable ? const Color(0xFFEAF5EF) : const Color(0xFFFEECEB),
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                            child: Text(
                              venue.status,
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                                color: isAvailable ? const Color(0xFF0B6B3A) : const Color(0xFFC72C2C),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 14.sp,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          SizedBox(width: 4.w),
                          Expanded(
                            child: Text(
                              venue.location,
                              style: textTheme.bodySmall?.copyWith(
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                          Text(
                            'Capacity: ${venue.capacity}',
                            style: textTheme.bodySmall?.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      if (upcomingMatch != null) ...[
                        SizedBox(height: 8.h),
                        Divider(height: 1.h),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Icon(
                              Icons.event_outlined,
                              size: 14.sp,
                              color: theme.colorScheme.primary,
                            ),
                            SizedBox(width: 6.w),
                            Expanded(
                              child: Text(
                                'Upcoming: ${upcomingMatch.date} at ${upcomingMatch.time}',
                                style: textTheme.bodySmall?.copyWith(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w500,
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
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
