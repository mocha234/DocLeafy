import 'package:flutter/material.dart';
//import './myWebView.dart';
import '../static/appBars.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/infoModel.dart';
import 'constantsInfo.dart';

final String url = jsonInfoApi;
Future<Info> fetchInfo(String plantName) async {
  final response = await http.get(url);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print("Statusssss: 200");
    print(response.body);
    return Info.fromJson(
      jsonDecode(response.body),
      plantName
    );
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Predictions');
  }
}

class InformationScreen extends StatefulWidget {
  final int selpredDis; //Selected or Predition Disease
  final String plantName;
  final String diseaseName;

  InformationScreen({Key key, this.selpredDis, this.diseaseName, this.plantName})
      : super(key: key);

  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  Future<Info> futureInfo;

  void initState() {
    super.initState();
    futureInfo = fetchInfo(widget.plantName);
  }

  @override
  Widget build(BuildContext context) {
    print("Index of the Disease name is " + widget.selpredDis.toString());
    return Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        appBar:
            standardAppBar(context: context, appBarName: widget.diseaseName),
        body: Container(
          margin: EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: FutureBuilder<Info>(
              future: futureInfo,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 12.0,
                        ),
                        Image.network(
                            'https://picsum.photos/250?image=${widget.selpredDis}'),
                        SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          snapshot.data.diseaseInfos[widget.selpredDis].name,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          snapshot.data.diseaseInfos[widget.selpredDis].intro,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          snapshot.data.diseaseInfos[widget.selpredDis].cause1,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          snapshot.data.diseaseInfos[widget.selpredDis].cause2,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          snapshot.data.diseaseInfos[widget.selpredDis].cause3,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          snapshot
                              .data.diseaseInfos[widget.selpredDis].solution1,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          snapshot
                              .data.diseaseInfos[widget.selpredDis].solution2,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          snapshot
                              .data.diseaseInfos[widget.selpredDis].solution3,
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return Center(
                  heightFactor: 10.0,
                  child: CircularProgressIndicator(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                );
              },
            ),
          ),
        ));
  }
}
