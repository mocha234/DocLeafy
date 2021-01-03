import 'package:flutter/material.dart';
//import './myWebView.dart';
import '../static/appBars.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../static/scaleTransition.dart';
import 'infoScreen.dart';
import 'constantsInfo.dart';

final String url = jsonInfoApi;

class GeneralInformationScreen extends StatefulWidget {
  final String plantName;
  GeneralInformationScreen({Key key, this.plantName}) : super(key: key);

  @override
  _GeneralInformationScreen createState() => _GeneralInformationScreen();
}

class _GeneralInformationScreen extends State<GeneralInformationScreen> {
  List data = [];

  final String url = jsonInfoApi;
  fetchInfo() async {
    var response = await http.get(url);
    setState(() {
      var converted = json.decode(response.body);
      //data = converted['disease'];
      data = converted[widget.plantName];
      print(data);
      print(data[0]["name"]);
      print(data[0]["solution"]);
      print("Data length");
      print(data.length);
    });
  }

  void tapthis(int index) {
    Navigator.push(
        context,
        ScaleRoute(
            page: InformationScreen(
          selpredDis: index,
        )));
  }

  void initState() {
    super.initState();
    fetchInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: standardAppBar(
            context: context, appBarName: "Other Diseases' Information"),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
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
                          child: Image.network(
                              'https://picsum.photos/250?image=$index',
                              fit: BoxFit.cover),
                        ),
                        title: new Text(
                          data[index]['name'],
                        ),
                        subtitle: new Text(
                            "\nSome snapshot info " + data[index]['intro']),
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
