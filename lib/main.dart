import 'package:ccmd/core/theme/app_theme.dart';
import 'package:ccmd/features/auth/screens/login_screen.dart';
import 'package:ccmd/features/landing/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

void main() {
  runApp(const AppInitialize());
}

class AppInitialize extends StatelessWidget {
  const AppInitialize({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilPlusInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          theme: AppTheme.themeData,
          debugShowCheckedModeBanner: false,
          title: 'CCMD Cricket Management Platform',
          // home: LandingScreen()
          home: LoginScreen(),
        );
      }
    );
  }
}