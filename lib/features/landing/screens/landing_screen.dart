import 'package:ccmd/core/theme/app_colors.dart';
import 'package:ccmd/features/landing/controllers/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({super.key});
  final LandingController landingController = Get.put(LandingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => landingController.screens[landingController.curent_index.value]),
      bottomNavigationBar: Obx(
            () => Container(
          height: 70.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
            ),
            border: Border(
              top: BorderSide(
                color: const Color(0xFFE5E7EB),
                width: 1.w,
              ),
            ),
          ),
          child: SafeArea(
            top: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  icon: LucideIcons.home,
                  label: 'Home',
                  isSelected: landingController.curent_index.value == 0,
                  onTap: () {
                    landingController.curent_index.value = 0;
                  },
                ),
                _buildNavItem(
                  icon: LucideIcons.trophy,
                  label: 'Tournaments',
                  isSelected: landingController.curent_index.value == 1,
                  onTap: () {
                    landingController.curent_index.value = 1;
                  },
                ),
                _buildNavItem(
                  icon: LucideIcons.calendarDays,
                  label: 'Fixtures',
                  isSelected: landingController.curent_index.value == 2,
                  onTap: () {
                    landingController.curent_index.value = 2;
                  },
                ),
                _buildNavItem(
                  icon: LucideIcons.users,
                  label: 'Players',
                  isSelected: landingController.curent_index.value == 3,
                  onTap: () {
                    landingController.curent_index.value = 3;
                  },
                ),
                _buildNavItem(
                  icon: LucideIcons.moreHorizontal,
                  label: 'More',
                  isSelected: landingController.curent_index.value == 4,
                  onTap: () {
                    landingController.curent_index.value = 4;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    const primaryGreen = AppColors.primaryColor;
    const inactiveGray = AppColors.mutedText;

    final activeColor = isSelected ? primaryGreen : inactiveGray;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        splashColor: AppColors.primaryLight,
        highlightColor: AppColors.primaryLight.withOpacity(0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20.r,
              color: activeColor,
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: activeColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}