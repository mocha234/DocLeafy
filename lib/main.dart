import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/takePicScreen.dart';

//import './appBar.dart';

// Mellow Yellow (#FFE77AFF) and Verdant Green (#2C5F2DFF)

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor:
            //Color(0xFF2C5F2D),
            // Color(0xFF84b37b),
            Color(0xFF486942),

        accentColor:
            //Color(0xFFe0ca63),
            //Color(0xFFe6d585),
            Color(0xFFEFEFE8),
        //Colors.white,

        // Define the default font family.
        fontFamily: GoogleFonts.ubuntu().fontFamily,

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        // textTheme: TextTheme(
        //   headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        //   headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        //bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        // ),
      ),
      home: TakePictureScreen(
        camera: firstCamera,
      ),
    ),
  );
}
