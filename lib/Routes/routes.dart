import 'package:flutter/material.dart';
import 'package:news_app/Core/enums/news_source_enum.dart';
import 'package:news_app/Features/Details%20Screen.dart/details_screen.dart';
import 'package:news_app/Features/Home/home_screen.dart';
import 'package:news_app/Features/Splash%20Screen/splash_screen.dart';
import 'package:news_app/Models/news_headline_model.dart';
import 'package:news_app/Routes/route_name.dart';

import '../Features/Channel/channel_screen.dart';

class Routes {
  static Route<dynamic> ongenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: ((context) => const SplashScreen()));

      case RouteName.homeScreen:
        return MaterialPageRoute(builder: ((context) => const HomeScreen()));

      case RouteName.deatailsScreen:
        return MaterialPageRoute(
          builder: ((context) => DetailsScreen(article: settings.arguments as Articles)),
        );

      case RouteName.channel:
        return MaterialPageRoute(
          builder: ((context) => ChannelScreen(channel: settings.arguments as NewsSourceEnum)),
        );

      default:
        return MaterialPageRoute(builder: (context) => const ErrorScreen());
    }
  }
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text('Route not found :('),
      ),
    );
  }
}
