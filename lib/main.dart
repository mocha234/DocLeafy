import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import './screens/categoriesScreen.dart';

Future<void> main() async {
  // Initialize Camera as soon as app is prompted
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF486942), //Hunter Green
        accentColor: Color(0xFFEFEFE8), //Alabaster
        fontFamily: GoogleFonts.ubuntu().fontFamily,
      ),
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: Image.asset(
          "assets/images/DocLeafy_Logo_banner.png",
          fit: BoxFit.contain,
        ),
        nextScreen: CategoriesScreen(
          camera: firstCamera,
        ),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: Color(0xFFEFEFE8),
      ),

      // CategoriesScreen(
      //   camera: firstCamera,
      // ),

      //TakePictureScreen(
      //   camera: firstCamera,
      // ),
    ),
  );
}
