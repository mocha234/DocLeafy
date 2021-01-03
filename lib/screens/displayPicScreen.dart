import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tomatodiseasechecker/screens/generalInfoScreen.dart';
import 'dart:convert';
import "dart:io" as Io;

import "dart:io";
import '../models/predictionModel.dart';
import '../static/scaleTransition.dart';
import 'infoScreen.dart';
import '../static/appBars.dart';
import './constantsInfo.dart';

Future<Predicted> fetchPredictions(imagePath2File, int categoryIndex) async {
  final bytes = Io.File(imagePath2File).readAsBytesSync();
  final String endpointAPI = projectAPI[categoryIndex]["APIEndpoint"];
  final String predictionKey = projectAPI[categoryIndex]["Prediction-Key"];
  final String contentType = projectAPI[categoryIndex]["Content-Type"];

  var uri = Uri.parse(endpointAPI);
  var request = new http.Request("POST", uri)
    ..headers['Prediction-Key'] = predictionKey
    ..headers['Content-Type'] = contentType
    ..bodyBytes = bytes;

  http.Response response = await http.Response.fromStream(await request.send());
  print(request);
  print("Result: ${response.statusCode}");
  print(response.statusCode);
  print(response.body);
  print("sssswfgges");
  print("0ssssss");

  return Predicted.fromJson(jsonDecode(response.body));
}

class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;
  final Future<Predicted> futurePredictions1;
  final int categoryIndex;

  DisplayPictureScreen(
      {Key key, this.imagePath, this.futurePredictions1, this.categoryIndex})
      : super(key: key);

  @override
  _DisplayPictureScreenState createState() => _DisplayPictureScreenState(
      //futurePredictions1, imagePath
      );
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  Future<Predicted> futurePredictions1;
  //String imagePath;
  String textDisplay;
  //_DisplayPictureScreenState(this.futurePredictions1, this.imagePath);

  @override
  void initState() {
    super.initState();
    print("Temp Image Path: " + widget.imagePath);
    print("categoryIndex: " + widget.categoryIndex.toString());
    futurePredictions1 =
        fetchPredictions(widget.imagePath, widget.categoryIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: standardAppBar(context: context, appBarName: "Disease Identified"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.file(File(widget.imagePath)),
          Center(
            child: FutureBuilder<Predicted>(
              future: futurePredictions1,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print("This is printed.");
                  print(snapshot.data.toString());
                  print(snapshot.data.predictions);
                  print(snapshot.data.predictions[0].tagName);

                  textDisplay = snapshot.data.predictions[0].tagName.toString();
                  // Index 0 has the highest probabilty

                  return Column(
                    children: [
                      Text(
                        "The plan disease identified most likely to be: ",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        textDisplay,
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }

                // By default, show a loading spinner.
                return CircularProgressIndicator(
                  backgroundColor: Theme.of(context).primaryColor,
                );
              },
            ),
          ),
          Column(
            children: [
              RaisedButton(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Theme.of(context).primaryColor)),
                textColor: Theme.of(context).primaryColor,
                color: Theme.of(context).accentColor,
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  "Info about the disease",
                ),
                onPressed: () {
                  print("Passing arguments");
                  print("textDisplay = " + textDisplay);
                  Navigator.push(
                      context,
                      ScaleRoute(
                          page: InformationScreen(
                        selpredDis: diseaseIndexMapping[textDisplay],
                        diseaseName: textDisplay,
                      )));
                },
              ),
              RaisedButton(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Theme.of(context).primaryColor)),
                textColor: Theme.of(context).primaryColor,
                color: Theme.of(context).accentColor,
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  "Other diseases' Info",
                ),
                onPressed: () {
                  print("Navigating to General InfoPage");
                  Navigator.push(
                      context, ScaleRoute(page: GeneralInformationScreen()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//TODO: convert image form path to stirng to POST then only get
// or post then use .then https://stackoverflow.com/questions/50278258/http-post-with-json-on-body-flutter-dart

//Success POS and get, but stuck in stream ..need change to string and print it out
// from response.body, break down the nested JSON and take the first prediction
