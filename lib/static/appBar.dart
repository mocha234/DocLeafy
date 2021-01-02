import 'package:flutter/material.dart';
import 'scaleTransition.dart';
import '../screens/generalInfoScreen.dart';

Widget appBar(BuildContext context, {bool iconB}) {
  void _appInfo() {
    showDialog(
        //barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "An App by Team Alam",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                Text(
                  "This App is for Microsoft ImaginceCup's Participation",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          );
        });
  }

  return AppBar(
    centerTitle: true,
    title: Text(
      'Plant Disease Identifier',
      style: TextStyle(color: Theme.of(context).accentColor
          // Colors.white
          ),
    ),
    backgroundColor: Theme.of(context).primaryColor,
    actions: [
      iconB == true
          ? IconButton(
              icon: Icon(Icons.people_outline),
              onPressed: _appInfo,
            )
          : IconButton(
              icon: Icon(
                Icons.info_outline,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () {
                Navigator.push(
                    context, ScaleRoute(page: GeneralInformationScreen()));
              },
            )
    ],
  );
}
