import 'package:flutter/material.dart';

class AppFutureBuilder extends StatelessWidget {
  // parameter
  final Future<dynamic>? future;
  final Widget waitingWidget;
  final Widget Function(BuildContext, AsyncSnapshot<dynamic>) dataWidget;

  // constructor
  const AppFutureBuilder({
    super.key,
    required this.future,
    required this.waitingWidget,
    required this.dataWidget,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future, // future
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return waitingWidget; // waiting widget
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            // returning data widget in case the snapshot has data
            return dataWidget(context,snapshot);
          } else {
            return const Center(
              child: Text('Nothing to show :('),
            );
          }
        } else {
          return const Center(
            child: Text('Something Went Wrong'),
          );
        }
      },
    );
  }
}
