import 'package:flutter/material.dart';
import 'dart:async';
import '../Cliente/nav.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super (key:key);
  
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Nav()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/Icons_launcher/icon_logo.png',
            height: 500,
            ),
            const SizedBox(height: 30,),
            const CircularProgressIndicator(
              color: Colors.white
            )
          ],
        )
      ),
    );
  }
}