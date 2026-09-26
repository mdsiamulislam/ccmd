import 'package:ccmd/features/landing/controllers/landing_controller.dart';
import 'package:ccmd/features/umpires/screens/umpire_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

class UmpiresScreen extends StatelessWidget {
  const UmpiresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final landingController = Get.find<LandingController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Umpires'),
      ),
      body: SafeArea(
        top: false,
        child: Obx(() {
          if (landingController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          final umpires = landingController.umpires;

          if (umpires.isEmpty) {
            return const Center(child: Text('No umpires available.'));
          }

          return ListView.separated(
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
            itemCount: umpires.length,
            separatorBuilder: (_, __) => SizedBox(height: 10.h),
            itemBuilder: (context, index) {
              final umpire = umpires[index];
              return InkWell(
                onTap: () {
                  Get.to(() => UmpireDetailsScreen(umpire: umpire));
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
                            umpire.name.isNotEmpty ? umpire.name.substring(0, 2).toUpperCase() : 'UM',
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
                                umpire.name,
                                style: textTheme.titleSmall?.copyWith(
                                  fontSize: 14.sp,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                'Age: ${umpire.age} · ${umpire.experience}',
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
            },
          );
        }),
      ),
    );
  }
}
