import 'package:flutter/material.dart';

// Widget appBar({BuildContext context, String appBarName}) {
//   // void _appInfo() {
//   //   showDialog(
//   //       //barrierDismissible: false,
//   //       context: context,
//   //       builder: (BuildContext context) {
//   //         return AlertDialog(
//   //           content: Column(
//   //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   //             children: [
//   //               FlatButton(onPressed: () {}, child: Text("Log Out")),
//   //               Text(
//   //                 "An App by Team Alam",
//   //                 style: TextStyle(color: Theme.of(context).primaryColor),
//   //               ),
//   //               Image.asset("assets/images/DocLeafy_Logo_banner.png"),
//   //               Text(
//   //                 "This App is for Microsoft ImaginceCup's Participation",
//   //                 textAlign: TextAlign.center,
//   //                 style: TextStyle(
//   //                   color: Theme.of(context).primaryColor,
//   //                 ),
//   //               ),
//   //             ],
//   //           ),
//   //         );
//   //       });
//   // }

//   return AppBar(
//     automaticallyImplyLeading: false,
//     centerTitle: true,
//     title: Text(
//       appBarName,
//       style: TextStyle(color: Theme.of(context).accentColor
//           // Colors.white
//           ),
//     ),
//     backgroundColor: Theme.of(context).primaryColor,
//     actions: [
//       IconButton(
//           icon: Icon(Icons.person_outline),
//           onPressed: () {
//             Navigator.push(context, ScaleRoute(page: ProfileScreen(

//             )));
//           }
//           //_appInfo,
//           )
//     ],
//   );
// }

Widget standardAppBar({BuildContext context, String appBarName}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      appBarName,
      style: TextStyle(color: Theme.of(context).accentColor
          // Colors.white
          ),
    ),
    backgroundColor: Theme.of(context).primaryColor,
  );
}
