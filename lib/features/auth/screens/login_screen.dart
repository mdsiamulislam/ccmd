import 'package:ccmd/features/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:get/get.dart';

import '../../../core/const/asset_string.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final AuthController authController = Get.put(AuthController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 24.h,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 420.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 24.h),

                  // ----------------------------------------------------------------
                  // BRANDING
                  // ----------------------------------------------------------------
                  Center(
                    child: Container(
                      width: 64.w,
                      height: 64.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        AssetString.logo,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  SizedBox(height: 12.h),

                  Text(
                    'CCMD',
                    textAlign: TextAlign.center,
                    style: textTheme.titleLarge?.copyWith(
                      fontSize: 22.sp,
                    ),
                  ),

                  SizedBox(height: 4.h),

                  Text(
                    'Cricket Management',
                    textAlign: TextAlign.center,
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: 14.sp,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),

                  SizedBox(height: 40.h),

                  // ----------------------------------------------------------------
                  // USERNAME / EMAIL
                  // ----------------------------------------------------------------
                  Text(
                    'Email / Username',
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 6.h),

                  TextField(
                    controller: authController.emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: 'official@bcb.gov.bd',
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // ----------------------------------------------------------------
                  // PASSWORD
                  // ----------------------------------------------------------------
                  Text(
                    'Password',
                    style: textTheme.bodyMedium?.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 6.h),

                  Obx(
                      ()=> TextField(
                        controller: authController.passwordController,
                        obscureText: authController.isObscure.value,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.r),
                            borderSide: BorderSide(
                              color: authController.isFailed.value
                                  ? theme.colorScheme.error
                                  : theme.colorScheme.outline,
                            ),
                          ),
                            hintText: 'Enter your password',
                            suffixIcon: IconButton(
                                onPressed: authController.toggleObscure,
                                icon: authController.isObscure.value
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility)
                            )
                        ),
                      ),
                  ),
                  SizedBox(height: 4.h),
                  Obx(
                      ()=> authController.isFailed.value
                          ? Text(
                        'Invalid email or password',
                        style: textTheme.bodySmall?.copyWith(
                          fontSize: 10.sp,
                          color: theme.colorScheme.error,
                        ),
                      )
                          : const SizedBox.shrink(),
                  ),

                  SizedBox(height: 20.h),

                  // ----------------------------------------------------------------
                  // LOGIN
                  // ----------------------------------------------------------------
                  Obx(
                      ()=> SizedBox(
                        height: 40.h,
                        child: ElevatedButton(
                          onPressed: authController.isLoading.value
                              ? null
                              : () async {
                            await authController.login();
                          },
                          child: authController.isLoading.value
                              ? SizedBox(
                            width: 20.w,
                            height: 20.w,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.w,
                              color: theme.colorScheme.onPrimary,
                            ),
                          )
                              : Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ),
                      )
                  ),

                  SizedBox(height: 48.h),

                  // ----------------------------------------------------------------
                  // FOOTER
                  // ----------------------------------------------------------------
                  Text(
                    'Authorized Access Only',
                    textAlign: TextAlign.center,
                    style: textTheme.bodySmall?.copyWith(
                      fontSize: 12.sp,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}