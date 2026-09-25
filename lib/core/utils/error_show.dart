import 'dart:developer' as developer;
import '../widgets/app_snackbar.dart';

class ErrorShow {

  static void showAndPrintError(String errorMessage, String? exception) {
    developer.log(errorMessage);
    AppSnackbar.error(errorMessage);
    if (exception != null) {
      developer.log('Exception: $exception');
    }
  }

}