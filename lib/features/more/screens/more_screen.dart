import 'package:ccmd/core/const/asset_string.dart';
import 'package:ccmd/core/widgets/app_snackbar.dart';
import 'package:ccmd/features/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'More',
          style: textTheme.titleLarge?.copyWith(
            fontSize: 18.sp,
          ),
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
            // PROFILE
            // ---------------------------------------------------------------
            Card(
              child: InkWell(
                borderRadius: BorderRadius.circular(12.r),
                onTap: () {
                  AppSnackbar.info('Profile management is not implemented yet.');
                },
                child: Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Row(
                    children: [
                      Container(
                        width: 48.w,
                        height: 48.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Image.asset(
                          AssetString.logo
                        )
                      ),

                      SizedBox(width: 12.w),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              'BCB Administrator',
                              style: textTheme.titleSmall?.copyWith(
                                fontSize: 15.sp,
                              ),
                            ),

                            SizedBox(height: 2.h),

                            Text(
                              'Administrator',
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
            ),

            SizedBox(height: 24.h),

            // ---------------------------------------------------------------
            // MANAGEMENT
            // ---------------------------------------------------------------
            const _SectionTitle(
              title: 'MANAGEMENT',
            ),

            SizedBox(height: 8.h),

            Card(
              child: Column(
                children: [
                  _MenuItem(
                    icon: Icons.groups_outlined,
                    title: 'Clubs',
                    subtitle: 'Manage participating clubs',
                    onTap: () {
                      AppSnackbar.info('Clubs management is not implemented yet.');
                    },
                  ),

                  _Divider(),

                  _MenuItem(
                    icon: Icons.sports_outlined,
                    title: 'Umpires',
                    subtitle: 'View and manage umpires',
                    onTap: () {
                      AppSnackbar.info('Umpires management is not implemented yet.');
                    },
                  ),

                  _Divider(),

                  _MenuItem(
                    icon: Icons.location_on_outlined,
                    title: 'Venues',
                    subtitle: 'Manage match venues',
                    onTap: () {
                      AppSnackbar.info('Venues management is not implemented yet.');
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            // ---------------------------------------------------------------
            // ACCOUNT
            // ---------------------------------------------------------------
            const _SectionTitle(
              title: 'ACCOUNT',
            ),

            SizedBox(height: 8.h),

            Card(
              child: Column(
                children: [
                  _MenuItem(
                    icon: Icons.notifications_none_outlined,
                    title: 'Notifications',
                    subtitle: 'View system notifications',
                    onTap: () {
                      AppSnackbar.info('Notifications management is not implemented yet.');
                    },
                  ),

                  _Divider(),

                  _MenuItem(
                    icon: Icons.settings_outlined,
                    title: 'Settings',
                    subtitle: 'Application preferences',
                    onTap: () {
                      AppSnackbar.info('Settings management is not implemented yet.');
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            // ---------------------------------------------------------------
            // ABOUT
            // ---------------------------------------------------------------
            const _SectionTitle(
              title: 'ABOUT',
            ),

            SizedBox(height: 8.h),

            Card(
              child: _MenuItem(
                icon: Icons.info_outline,
                title: 'About CCMD',
                subtitle: 'Cricket Management',
                onTap: () {
                  AppSnackbar.info('About CCMD is not implemented yet.');
                },
              ),
            ),

            SizedBox(height: 24.h),

            // ---------------------------------------------------------------
            // LOGOUT
            // ---------------------------------------------------------------
            SizedBox(
              height: 40.h,
              child: OutlinedButton.icon(
                onPressed: () {
                  _showLogoutDialog(context);
                },
                icon: Icon(
                  Icons.logout,
                  size: 19.sp,
                ),
                label: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: theme.colorScheme.error,
                  side: BorderSide(
                    color: theme.colorScheme.error,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20.h),

            Center(
              child: Text(
                'CCMD · Cricket Management',
                style: textTheme.bodySmall?.copyWith(
                  fontSize: 11.sp,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    final theme = Theme.of(context);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          title: const Text('Logout'),
          content: const Text(
            'Are you sure you want to logout?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => const LoginScreen());

                // Perform logout.
              },
              style: TextButton.styleFrom(
                foregroundColor: theme.colorScheme.error,
              ),
              child: const Text('Logout'),
            ),
          ],
        );
      },
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
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 4.w,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.3,
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

// =============================================================================
// MENU ITEM
// =============================================================================

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _MenuItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 14.w,
          vertical: 12.h,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 2.h),

                  Text(
                    subtitle,
                    style: textTheme.bodySmall?.copyWith(
                      fontSize: 11.sp,
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
    );
  }
}

// =============================================================================
// DIVIDER
// =============================================================================

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      indent: 62.w,
      color: Theme.of(context).dividerColor,
    );
  }
}