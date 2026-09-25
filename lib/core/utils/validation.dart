import '../widgets/app_snackbar.dart';

class Validation {
  static bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(email)) {
      AppSnackbar.error('Please enter a valid email address.');
      return false;
    }
    return true;
  }

  static bool isValidPassword(String password) {
    if (password.length < 6){
      AppSnackbar.error('Password must be at least 6 characters long.');
      return false;
    }
    return true;
  }
}