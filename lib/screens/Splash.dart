import 'dart:async';

import 'package:aps_final/components/Logo.dart';
import 'package:aps_final/screens/GetStarted.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), navToGetStarted);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Logo(
              300.0,
              300.0,
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Center(child: CircularProgressIndicator())
        ],
      ),
      backgroundColor: Colors.black,
    );
  }

  navToGetStarted() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => GetStarted()));
  }
}
