import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SnackbarType { success, info, warning, error }

class AppSnackbar {
  static void show({
    required String message,
    String? title,
    SnackbarType type = SnackbarType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    final context = Get.context;
    if (context == null) return;

    // Type UI Settings
    final config = _getSnackbarConfig(type);

    // Hide any active snackbar first
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    // Show Custom SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: duration,
        elevation: 0,
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        padding: EdgeInsets.zero,
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: config.backgroundColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: config.borderColor.withOpacity(0.15),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              // Icon Box
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: config.iconBgColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  config.icon,
                  color: config.iconColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),

              // Title and Message Text
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (title != null && title.isNotEmpty) ...[
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: config.textColor,
                        ),
                      ),
                      const SizedBox(height: 2),
                    ],
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: config.textColor.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper Shortcut Functions
  static void success(String message, {String? title}) {
    show(message: message, title: title, type: SnackbarType.success);
  }

  static void info(String message, {String? title}) {
    show(message: message, title: title, type: SnackbarType.info);
  }

  static void warning(String message, {String? title}) {
    show(message: message, title: title, type: SnackbarType.warning);
  }

  static void error(String message, {String? title}) {
    show(message: message, title: title, type: SnackbarType.error);
  }

  // Internal configuration mapper
  static _SnackbarStyleConfig _getSnackbarConfig(SnackbarType type) {
    switch (type) {
      case SnackbarType.success:
        return _SnackbarStyleConfig(
          backgroundColor: const Color(0xFFF0FDF4),
          borderColor: const Color(0xFFBBF7D0),
          iconBgColor: const Color(0xFFDCFCE7),
          iconColor: const Color(0xFF16A34A),
          textColor: const Color(0xFF14532D),
          icon: Icons.check_circle_rounded,
        );
      case SnackbarType.info:
        return _SnackbarStyleConfig(
          backgroundColor: const Color(0xFFF0F9FF),
          borderColor: const Color(0xFFBAE6FD),
          iconBgColor: const Color(0xFFE0F2FE),
          iconColor: const Color(0xFF0284C7),
          textColor: const Color(0xFF0C4A6E),
          icon: Icons.info_rounded,
        );
      case SnackbarType.warning:
        return _SnackbarStyleConfig(
          backgroundColor: const Color(0xFFFFFBEB),
          borderColor: const Color(0xFFFDE68A),
          iconBgColor: const Color(0xFFFEF3C7),
          iconColor: const Color(0xFFD97706),
          textColor: const Color(0xFF78350F),
          icon: Icons.warning_rounded,
        );
      case SnackbarType.error:
        return _SnackbarStyleConfig(
          backgroundColor: const Color(0xFFFEF2F2),
          borderColor: const Color(0xFFFECACA),
          iconBgColor: const Color(0xFFFEE2E2),
          iconColor: const Color(0xFFDC2626),
          textColor: const Color(0xFF7F1D1D),
          icon: Icons.error_rounded,
        );
    }
  }
}

class _SnackbarStyleConfig {
  final Color backgroundColor;
  final Color borderColor;
  final Color iconBgColor;
  final Color iconColor;
  final Color textColor;
  final IconData icon;

  _SnackbarStyleConfig({
    required this.backgroundColor,
    required this.borderColor,
    required this.iconBgColor,
    required this.iconColor,
    required this.textColor,
    required this.icon,
  });
}