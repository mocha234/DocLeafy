import 'package:flutter/material.dart';
//import './myWebView.dart';
import '../static/appBars.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
import '../static/scaleTransition.dart';
import 'infoScreen.dart';
import 'constantsInfo.dart';

// final String url = jsonInfoApi;

class GeneralInformationScreen extends StatefulWidget {
  final String plantName;
  GeneralInformationScreen({Key key, this.plantName}) : super(key: key);

  @override
  _GeneralInformationScreen createState() => _GeneralInformationScreen();
}

class _GeneralInformationScreen extends State<GeneralInformationScreen> {
  List data = [];

  // final String url = jsonInfoApi;
  // fetchInfo() async {
  //   var response = await http.get(url);
  //   setState(() {
  //     var converted = json.decode(response.body);
  //     //data = converted['disease'];
  //     data = converted[widget.plantName];
  //     print("sssss");
  //     print("Data length");
  //     print(data.length);
  //     print(widget.plantName);
  //     //print(data);
  //     //print(data[0]["solution"]);
  //   });
  // }

  void tapthis(int index) {
    Navigator.push(
        context,
        ScaleRoute(
            page: InformationScreen(
          selpredDis: index,
          plantName: widget.plantName,
          diseaseName: diseaseInfos[widget.plantName][index]["name"],
        )));
  }

  void initState() {
    super.initState();
    //fetchInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: standardAppBar(
            context: context, appBarName: "Other Diseases' Information"),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: diseaseInfos[widget.plantName].length,
          itemBuilder: (BuildContext context, int index) {
            // Disease's Info <START>
            // var diseaseinfos = diseaseInfos[widget.plantName][index]["name"];

            // String theDiseaseName = diseaseinfos;
            // String theDiseaseIntro = diseaseinfos["intro"];

            // Disease's Info <END>
            return GestureDetector(
              onTap: () {
                tapthis(index);
              },
              child: Container(
                padding: new EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 4.0),
                child: Card(
                  elevation: 10,
                  shadowColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ClipPath(
                    clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0))),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: Theme.of(context).primaryColor,
                                  width: 9.0))),
                      padding: EdgeInsets.fromLTRB(10.0, 12.0, 8.0, 12.0),
                      child: ListTile(
                        leading: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: 44,
                            minHeight: 44,
                            maxWidth: 64,
                            maxHeight: 64,
                          ),
                          child: Image.asset(
                              "assets/images/diseasesPic/${widget.plantName.toLowerCase()}/${diseaseInfos[widget.plantName][index]["name"].replaceAll(' ', '').toLowerCase()}.png",
                              fit: BoxFit.cover),
                        ),
                        title: new Text(
                          diseaseInfos[widget.plantName][index]["name"],
                          // data[index]['name'],
                        ),
                        subtitle: Text(
                          "\n" +
                              // data[index]['intro']
                              diseaseInfos[widget.plantName][index]["intro"],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
