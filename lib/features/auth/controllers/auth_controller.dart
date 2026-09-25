import 'package:ccmd/core/utils/validation.dart';
import 'package:ccmd/core/widgets/app_snackbar.dart';
import 'package:ccmd/features/landing/screens/landing_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {

  RxBool isObscure = true.obs;
  RxBool isLoading = false.obs;
  RxBool isFailed = false.obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void toggleObscure() {
    isObscure.value = !isObscure.value;
  }

  Future<void> login() async {
    isLoading.value = true;

    try {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        AppSnackbar.warning(
          'Please enter both email and password',
        );
        return;
      }

      if (!Validation.isValidEmail(email)) {
        AppSnackbar.warning(
          'Please enter a valid email address',
        );
        return;
      }

      if (!Validation.isValidPassword(password)) {
        AppSnackbar.warning(
          'Password must be at least 6 characters long',
        );
        return;
      }

      const testEmail = 'abc@mail.com';
      const testPassword = '123456';

      final isValidCredentials =
          email == testEmail && password == testPassword;

      if (!isValidCredentials) {
        isFailed.value = true;

        AppSnackbar.warning(
          'Invalid email or password',
        );
        return;
      }
      await Future.delayed(
        const Duration(seconds: 1),
      );

      isFailed.value = false;

      AppSnackbar.success(
        'Login successful',
      );
      Get.offAll(() => LandingScreen());
    } finally {
      isLoading.value = false;
    }
  }

}