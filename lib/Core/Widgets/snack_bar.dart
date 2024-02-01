import 'package:flutter/material.dart';

class AppSnakBar {
  static showSnackBar(BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        margin: const EdgeInsets.all(20),
        backgroundColor: Theme.of(context).colorScheme.inverseSurface,
      ),
    );
  }
}
