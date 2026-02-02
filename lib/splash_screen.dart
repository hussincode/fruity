import 'package:flutter/material.dart';
import 'package:fruity/home.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (c) => Home()));
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('images/logo/logo.png'),
      ),
    ); 
  }
}