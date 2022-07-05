import 'package:flutter/material.dart';
import 'package:blizzer/screens/splash/components/body.dart';
import 'package:blizzer/size_config.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    return Scaffold(
      body: Body(),
    );
  }
}
