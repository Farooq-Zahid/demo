import 'package:flutter/material.dart';

class AppErrorWidgets {
  static Widget noInternetWidget() {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.wifi_off),
          Text(
            'Something went wrong, please check your internet connection',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }


  static Widget imagenotLoaded() {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.hide_image),
          Text(
            'Image Could not be loaded :(',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
