import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import './screens/categoriesScreen.dart';
import './screens/loginPage.dart';
// import './screens/registerPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> _loggedInorNot() async {
  final prefs = await SharedPreferences.getInstance();
  final bool loggedIn = prefs.getBool('loggedIn');
  print("Functionnn Status:");
  print(loggedIn);
  return loggedIn;
}

Future<void> main() async {
  // Initialize Camera as soon as app is prompted

  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  bool _loggedIn = await _loggedInorNot() ?? false;
  print("Main Status:");
  print(_loggedIn);

  // @override
  // void initState() {
  //   super.initState();

  // }

  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF486942), //Hunter Green
          accentColor: Color(0xFFEFEFE8), //Alabaster
          fontFamily: GoogleFonts.ubuntu().fontFamily,
        ),
        home: 
             _loggedIn
            ? AnimatedSplashScreen(
                duration: 2500,
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
              )
            : AnimatedSplashScreen(
                duration: 2500,
                splash: Image.asset(
                  "assets/images/DocLeafy_Logo_banner.png",
                  fit: BoxFit.contain,
                ),
                nextScreen: LoginPage(
                  camera: firstCamera,
                ),
                splashTransition: SplashTransition.fadeTransition,
                pageTransitionType: PageTransitionType.fade,
                backgroundColor: Color(0xFFEFEFE8),
              )

        // CategoriesScreen(
        //   camera: firstCamera,
        // ),

        //TakePictureScreen(
        //   camera: firstCamera,
        // ),
        ),
  );
}

// class RestartWidget extends StatefulWidget {
//   RestartWidget({this.child});

//   final Widget child;

//   static void restartApp(BuildContext context) {
//     context.findAncestorStateOfType<_RestartWidgetState>().restartApp();
//   }

//   @override
//   _RestartWidgetState createState() => _RestartWidgetState();
// }

// class _RestartWidgetState extends State<RestartWidget> {
//   Key key = UniqueKey();

//   void restartApp() {
//     setState(() {
//       key = UniqueKey();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return KeyedSubtree(
//       key: key,
//       child: widget.child,
//     );
//   }
// }
