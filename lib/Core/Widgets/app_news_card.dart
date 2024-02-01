import 'package:flutter/material.dart';

class AppNewsCard extends StatelessWidget {
  // parameter for the class
  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  // constructor
  const AppNewsCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(12),
    this.margin = const EdgeInsets.all(12),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        /* 
        the color for the card is comming from the 
        theme defined in the color scheme seed (Theme folder -> app_theme.dart)
        the purpose of using color from the theme is to optimize it 
        with the system theme (light and dark theme) 
        */
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow,
            blurRadius: 15,
          ),
        ],
      ),
      child: child, // child from the constructor
    );
  }
}
