import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                Home()
            )
        )
    );
  }
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFF3E5F5),
                Color(0xFFE1BEE7),
                Color(0xFFCE93D7),
                Color(0xFFBA68C6)
              ]
          )
      ),
      child: Container(
        margin: EdgeInsets.all(10),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("assets/notee2.png",height: 100, width: 200,),

            Text("Note ME", textAlign: TextAlign.center, style: TextStyle(fontSize: 50, color: Colors.white),),
            SizedBox(height: 20,),
            CircularProgressIndicator(),
          ],

        ),
      ),
    );
  }
}