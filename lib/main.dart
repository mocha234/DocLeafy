import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/categoriesScreen.dart';

Future<void> main() async {
  // Initialize Camera as soon as app is prompted
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF486942), //Hunter Green
        accentColor: Color(0xFFEFEFE8), //Alabaster
        fontFamily: GoogleFonts.ubuntu().fontFamily,
      ),
      home: CategoriesScreen(
        camera: firstCamera,
      ),

      //TakePictureScreen(
      //   camera: firstCamera,
      // ),
    ),
  );
}
