import 'dart:async';

import 'package:flutter/material.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/utils/app_images.dart';
import 'package:practical_assessment_mahammadsad_zestbrains/views/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),(){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SignInScreen()), (route) => false);
    });
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.splashBackgroundImage),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Gradient overlay
          Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(0, 180, 191, 0.56),
                  Color.fromRGBO(0, 180, 191, 0.56),
                  Color.fromRGBO(0, 180, 191, 0.84),
                ],
                stops: [0.0, 0.5, 1.0],
              ),
            ),
          ),

          // Center content
          SafeArea(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AppImages.appLogoPNG,
                    width: size.width * 0.4, // responsive logo
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Clip Cuts",
                    style: TextStyle(
                      fontFamily: 'pattaya',
                      fontWeight: FontWeight.w400,
                      fontSize: size.width * 0.1, // responsive text
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Decorative Positioned widgets
          Positioned(
            bottom: 0,
            right: size.width * -0.1,
            child: Image.asset(AppImages.bottomCircleLine1),
          ),
          Positioned(
            top: 0,
            left: size.width * -0.03,
            child: Image.asset(AppImages.topLeftLines1),
          ),
        ],
      ),
    );
  }
}
