import 'package:flutter/material.dart';
import 'package:news_app/Core/Constants/images_path.dart';
import 'package:news_app/Routes/route_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    moveToNextScreen();
    super.initState();
  }

  // moving to the next screen
  Future<void> moveToNextScreen() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
    // ignore: use_build_context_synchronously
    Navigator.pushNamedAndRemoveUntil(
      context,
      RouteName.homeScreen,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AppImages.splash,
                    height: 290,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'Know The World',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 30),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'News App',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
