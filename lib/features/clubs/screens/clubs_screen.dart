import 'package:ccmd/features/clubs/screens/club_details_screen.dart';
import 'package:ccmd/features/landing/controllers/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

class ClubsScreen extends StatelessWidget {
  const ClubsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final landingController = Get.find<LandingController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clubs'),
      ),
      body: SafeArea(
        top: false,
        child: Obx(() {
          if (landingController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          final clubs = landingController.clubs;

          if (clubs.isEmpty) {
            return const Center(child: Text('No clubs available.'));
          }

          return ListView.separated(
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
            itemCount: clubs.length,
            separatorBuilder: (_, __) => SizedBox(height: 10.h),
            itemBuilder: (context, index) {
              final club = clubs[index];
              return InkWell(
                onTap: () {
                  Get.to(() => ClubDetailsScreen(club: club));
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
                            club.name.isNotEmpty ? club.name.substring(0, 2).toUpperCase() : 'CB',
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
                              Text(
                                club.name,
                                style: textTheme.titleSmall?.copyWith(
                                  fontSize: 14.sp,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                'Representative: ${club.representative}',
                                style: textTheme.bodySmall?.copyWith(
                                  fontSize: 12.sp,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                '${club.playerCount} Players',
                                style: textTheme.bodySmall?.copyWith(
                                  fontSize: 11.sp,
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.w500,
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
