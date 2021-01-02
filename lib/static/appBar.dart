import 'package:flutter/material.dart';
import 'scaleTransition.dart';
import '../screens/generalInfoScreen.dart';

Widget appBar(BuildContext context, {bool iconB}) {
  // void _appInfo(context) {

  //   showDialog(
  //     //barrierDismissible: false,
  //     context: context,
  //     builder: (context) {
  //       // return StatefulBuilder(builder: (context, setState) {
  //         return SafeArea(
  //           child: Container(
  //             decoration: BoxDecoration(
  //               color: Theme.of(context).primaryColor,
  //               borderRadius: BorderRadius.all(Radius.circular(10.0)),
  //             ),
  //             margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
  //             child: Column(
  //               children: [
  //                 Center(
  //                   child: Image.network('https://picsum.photos/250?image=1'),
  //                 ),
  //                 Text(
  //                   "Plant Identifier",
  //                   style: TextStyle(),
  //                 ),
  //                 Text("by Team Alam"),
  //                 Text(
  //                     "Plant IdentifierIdentifierIdentifierIdentifierIdentifier"),
  //               ],
  //             ),
  //           ),
  //         );
  //       // }
  //       // );
  //     },
  //     // child: AlertDialog(
  //     //   title: Text("My Super title"),
  //     //   content: Text("Hello World"),
  //     // )
  //   );
  // }

  void _appInfo() {
    showDialog(
        //barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "An App by Team Alam",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            content: Column(
              children: [
                Text(
                  "This App is for Microsoft ImaginceCup's Participation",
                  style: TextStyle(color: Theme.of(context).primaryColor),
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
