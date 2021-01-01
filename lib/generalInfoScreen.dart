import 'package:flutter/material.dart';
//import './myWebView.dart';
import 'appBar.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import './scaleTransition.dart';
import './inforScreen.dart';
import './constantsInfo.dart';

final String url = jsonInfoApi;

class GeneralInformationScreen extends StatefulWidget {
  GeneralInformationScreen({Key key}) : super(key: key);

  @override
  _GeneralInformationScreen createState() => _GeneralInformationScreen();
}

class _GeneralInformationScreen extends State<GeneralInformationScreen> {
  List data = [];

  final String url = jsonInfoApi;
  fetchnews() async {
    var response = await http.get(url);
    setState(() {
      var converted = json.decode(response.body);
      data = converted['disease'];
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
    fetchnews();
  }

  // List<Widget> _getListings() {
  //   List listings = List<Widget>();
  //   int i = 0;
  //   int totalLength = data.length;
  //   for (i = 0; i < totalLength; i++) {
  //     listings.add(InkWell(
  //       onTap: () {
  //         Navigator.push(
  //             context,
  //             ScaleRoute(
  //                 page: InformationScreen(
  //               diseaseName: data[i]["name"],
  //               diseaseInfo: data[i]["solution"],
  //               diseaseSampleImage: 'https://picsum.photos/250?image=$i',
  //             )));
  //       },
  //       child: Container(
  //         height: 150,
  //         child: Card(
  //           elevation: 10,
  //           margin: EdgeInsets.all(10),
  //           shadowColor: Colors.white,
  //           color: Colors.white,
  //           clipBehavior: Clip.antiAlias,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(10.0),
  //           ),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.all(4.0),
  //                 child: Image.network(
  //                   'https://picsum.photos/250?image=$i',
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //               Expanded(
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     SizedBox(
  //                       height: 5.0,
  //                     ),
  //                     Text(
  //                       data[i]["name"],
  //                       style: TextStyle(color: Colors.black),
  //                     ),
  //                     SizedBox(
  //                       height: 5.0,
  //                     ),
  //                     Flexible(
  //                       child: Text(
  //                         data[i]["solution"],
  //                         //textAlign: TextAlign.left,
  //                         style: TextStyle(color: Colors.black),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ));
  //   }
  //   return listings;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context, iconB: true),
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
                        // enabled: data[index]['name'] == 'Bacterial Spot'
                        //     ? true
                        //     : false,
                        title: new Text(
                          data[index]['name'],
                        ),
                        subtitle: new Text(
                            "\nSome snapshot info " + data[index]['name']),
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
