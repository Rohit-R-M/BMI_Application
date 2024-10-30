import 'dart:async';

import 'package:bmi/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BMISplashScreen extends StatefulWidget {
  const BMISplashScreen({super.key});

  @override
  State<BMISplashScreen> createState() => _BMISplashScreenState();
}

class _BMISplashScreenState extends State<BMISplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 3),
      () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => BMIHomeScreen(),)),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xffa18cd1),Color(0xfffbc2eb)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        ),
        child: Center(
          child: Text("Bmi Calculator",style: GoogleFonts.qwitcherGrypen(textStyle: TextStyle(fontSize: 80,fontWeight: FontWeight.w700),)),
        ),
      ),
    );
  }
}
