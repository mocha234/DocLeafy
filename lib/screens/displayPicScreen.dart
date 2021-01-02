import 'package:flutter/material.dart';
import '../models/predictionModel.dart';
import '../static/scaleTransition.dart';
import '../static/infoScreen.dart';
import 'package:http/http.dart' as http;
import "dart:io" as Io;
import "dart:io";
import 'dart:convert';
import '../static/appBar.dart';
import 'constantsInfo.dart';

Future<Predicted> fetchPredictions(imagePath2File) async {
  final bytes = Io.File(imagePath2File).readAsBytesSync();

  var uri = Uri.parse(
      "https://southcentralus.api.cognitive.microsoft.com/customvision/v3.0/Prediction/c1e64998-1818-447c-aaaf-c843556c689d/classify/iterations/Iteration1/image");
  var request = new http.Request("POST", uri)
    ..headers['Prediction-Key'] = "c7b138e5496f410ca88bafff534d13da"
    ..headers['Content-Type'] = "application/octet-stream"
    ..bodyBytes = bytes;

  http.Response response = await http.Response.fromStream(await request.send());
  print(request);
  print("Result: ${response.statusCode}");
  print(response.statusCode);
  print(response.body);
  print("sssswfgges");
  //print(response.body[0][1]);
  print("0ssssss");

  return Predicted.fromJson(jsonDecode(response.body));
}

class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;
  final Future<Predicted> futurePredictions1;
  DisplayPictureScreen({Key key, this.imagePath, this.futurePredictions1})
      : super(key: key);

  @override
  _DisplayPictureScreenState createState() =>
      _DisplayPictureScreenState(futurePredictions1, imagePath);
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  Future<Predicted> futurePredictions1;
  String imagePath;
  String textDisplay;
  _DisplayPictureScreenState(this.futurePredictions1, this.imagePath);

  @override
  void initState() {
    super.initState();
    print("Temp Image Path: " + imagePath);
    futurePredictions1 = fetchPredictions(imagePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: appBar(context),
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
                  )));
            },
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
