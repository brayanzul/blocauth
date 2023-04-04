import 'dart:async';

import 'package:blocauth/screens/home_screen.dart';
import 'package:blocauth/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/sign_in_provider.dart';
import '../utils/config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // init state
  @override
  void initState() {
    final sp = context.read<SignInProvider>();
    super.initState();
    // create a timer of 2 seconds
    Timer(const Duration(seconds: 2), () {
      sp.isSignedIn == false
        ? Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()))
        : Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image(
            image: AssetImage(Config.app_icon),
            height: 100,
            width: 100,
          ),
        ),
      ),
    );
  }
}
