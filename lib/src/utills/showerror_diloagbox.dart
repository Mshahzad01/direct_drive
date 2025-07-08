import 'package:flutter/material.dart';

class Utils {
  static void showErrorDialog({
    required BuildContext context,
    required String title,
    //String title = 'Error',
    required String message,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false, 
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.grey, fontSize: 16),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
