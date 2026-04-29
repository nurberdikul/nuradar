import 'package:flutter/material.dart';

class CustomSnackbar {
  static void showError(BuildContext context, String message) {
    _show(
      context,
      message,
      Colors.redAccent.withValues(alpha: 0.9),
      Icons.error_outline,
    );
  }

  static void showSuccess(BuildContext context, String message) {
    _show(
      context,
      message,
      Colors.green.withValues(alpha: 0.9),
      Icons.check_circle_outline,
    );
  }

  static void showInfo(BuildContext context, String message) {
    _show(
      context,
      message,
      Colors.indigo.withValues(alpha: 0.9),
      Icons.info_outline,
    );
  }

  static void _show(
    BuildContext context,
    String message,
    Color backgroundColor,
    IconData icon,
  ) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
