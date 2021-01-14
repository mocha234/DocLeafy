import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../static/appBars.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import '../models/infoModel.dart';
import './constantsInfo.dart';

// Future<Info> fetchInfo(String plantName) async {
//   final response = await http.get(url);

//   if (response.statusCode == 200) {
//     // If the server did return a 200 OK response,
//     // then parse the JSON.
//     print("Statusssss: 200");

//     print(response.body);
//     return Info.fromJson(jsonDecode(response.body), plantName);
//   } else {
//     // If the server did not return a 200 OK response,
//     // then throw an exception.
//     throw Exception('Failed to load Infos');
//   }
// }

_launchURL(String refURL) async {
  if (await canLaunch(refURL)) {
    launch(refURL);
  } else {
    throw 'Could not launch $refURL';
  }
}

class InformationScreen extends StatefulWidget {
  final int selpredDis; //Selected or Predition Disease
  final String plantName;
  final String diseaseName;

  InformationScreen(
      {Key key, this.selpredDis, this.diseaseName, this.plantName})
      : super(key: key);

  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  // Future<Info> futureInfo;

  // void initState() {
  //   super.initState();
  //   futureInfo = fetchInfo(widget.plantName);
  // }

  @override
  Widget build(BuildContext context) {
    print("Index of the Disease name is " + widget.selpredDis.toString());
    //print(diseaseName);

    // Disease's Info <START>
    var diseaseinfos = diseaseInfos[widget.plantName][widget.selpredDis];
    final String theDiseaseName = diseaseinfos["name"];
    final String theDiseaseIntro = diseaseinfos["intro"];
    final String theDiseaseSympnSign = diseaseinfos["symptomandsigns"];
    final String theDiseaseCause1 = diseaseinfos["cause1"];
    final String theDiseaseCause2 = diseaseinfos["cause2"];
    final String theDiseaseCause3 = diseaseinfos["cause3"];
    final String theDiseaseSolution1 = diseaseinfos["solution1"];
    final String theDiseaseSolution2 = diseaseinfos["solution2"];
    final String theDiseaseSolution3 = diseaseinfos["solution3"];
    final String theDiseaseReference = diseaseinfos["reference"];
    // Disease's Info <END>
    print(theDiseaseName);
    print("Plant Type" + widget.plantName);
    return Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        appBar:
            standardAppBar(context: context, appBarName: widget.diseaseName),
        body: Container(
          margin: EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0),
          child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 12.0,
                    ),
                    Center(
                      child: Image.asset(
                          "assets/images/diseasesPic/${widget.plantName.toLowerCase()}/${theDiseaseName.replaceAll(' ', '').toLowerCase()}.png",
                          fit: BoxFit.cover),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      theDiseaseName,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 21.0),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      "Introduction",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      theDiseaseIntro,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      "Symptoms and Signs",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      theDiseaseSympnSign,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      "Causes:",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      theDiseaseCause1,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      theDiseaseCause2,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      theDiseaseCause3,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      "Solutions :",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      theDiseaseSolution1,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      theDiseaseSolution2,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      theDiseaseSolution3,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    RaisedButton(
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(
                              color: Theme.of(context).primaryColor)),
                      textColor: Theme.of(context).primaryColor,
                      color: Theme.of(context).accentColor,
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Read directly from source site",
                      ),
                      onPressed: () => _launchURL(theDiseaseReference),
                      // () {

                      // _launchURL(snapshot
                      //     .data
                      //     .diseaseInfos[widget.selpredDis]
                      //     .referenceSite);
                      //   print("ssssssssssssssssssssss");

                      //   _launchURL;
                      // }
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                  ],
                ),
              )),
        ));
  }
}
