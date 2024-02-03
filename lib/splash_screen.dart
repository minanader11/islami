import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islamy/home/home_screen.dart';
import 'package:islamy/providers/app_configure_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3), // Change the duration as needed
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      body: provider.themeMode==ThemeMode.light? Image.asset('assets/images/splash_screen.png'):Image.asset('assets/images/splash_dark.png')
    );
  }
}
