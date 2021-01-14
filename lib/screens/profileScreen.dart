import 'package:docleafy/screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:camera/camera.dart';
import './constantsInfo.dart';

// import '../main.dart';

import '../static/scaleTransition.dart';
import 'dart:async';

class ProfileScreen extends StatefulWidget {
  final CameraDescription camera;
  ProfileScreen({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Future<bool> _loggedInorNot() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final bool loggedIn = prefs.getBool('loggedIn');
  //   return loggedIn;
  // }

  Future<void> _userSignout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('loggedIn', false);
    //setState(() => prefs.setBool('loggedIn', false));
    final loggedIn = prefs.getBool('loggedIn');
    print("Logged in?");
    print(loggedIn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        body: ListView(
          shrinkWrap: true,
          children: [
            Container(
              child: Image.asset("assets/images/DocLeafy_Logo_banner.png"),
              padding: EdgeInsets.all(70.0),
            ),
            Text(
              "An App by Team Alam",
              textAlign: TextAlign.center,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(
              "About",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
            SizedBox(
              height: 7.0,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
              child: Text(
                aboutText[0],
                textAlign: TextAlign.center,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
              child: Text(
                aboutText[1],
                textAlign: TextAlign.center,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            // RaisedButton(
            //   onPressed: () async {
            //     await _userSignout();

            //     Navigator.push(
            //         context,
            //         ScaleRoute(
            //             page: LoginPage(
            //           camera: null,
            //         )));
            //   },
            //   child: Text("Log Out"),
            // ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: RaisedButton(
                onPressed: () async {
                  await _userSignout();
                  Navigator.push(
                      context,
                      ScaleRoute(
                          page: LoginPage(
                        camera: null,
                      )));
                },
                //splashColor: Colors.transparent,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Theme.of(context).primaryColor)),
                textColor: Theme.of(context).primaryColor,
                color: Theme.of(context).accentColor,
                //padding: const EdgeInsets.all(6.0),

                child: Text(
                  "Log Out",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// RaisedButton(
//                 onPressed: () async {
//                   await _userSignout();
//                   RestartWidget.restartApp(context);

//                   // Navigator.push(context, ScaleRoute(page: RestartWidget(

//                   // )));
//                 },
//                 //splashColor: Colors.transparent,
//                 elevation: 2.0,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     side: BorderSide(color: Theme.of(context).primaryColor)),
//                 textColor: Theme.of(context).primaryColor,
//                 color: Theme.of(context).accentColor,
//                 //padding: const EdgeInsets.all(6.0),

//                 child: Text(
//                   "Log Out",
//                   style: TextStyle(
//                       color: Theme.of(context).primaryColor, fontSize: 16.0),
//                 ),
//               ),
