import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import '../screens/constantsInfo.dart';
import '../static/appBar.dart';
import '../static/scaleTransition.dart';
import '../screens/takePicScreen.dart';

class CategoriesScreen extends StatefulWidget {
  final CameraDescription camera;

  const CategoriesScreen({
    Key key,
    @required this.camera,
  }) : super(key: key);
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: appBar(context, iconB: true),
      body: Container(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 3.0,
          ),
          physics: BouncingScrollPhysics(),
          itemCount: categoriesMap.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                // runOnce();
                print(index);
                Navigator.push(
                    context,
                    ScaleRoute(
                        page: TakePictureScreen(
                      camera: widget.camera,
                      categoryIndex: index,
                    )));
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(4.0, 7.0, 4.0, 0.0),
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(9.0)),
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 4.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //Change Image, use map to insert filepath and pass to assetimage belwo
                    //Image.asset(categoriesMap[index]["imagePath"]),
                    Icon(Icons.ac_unit),
                    Text(categoriesMap[index]["name"]),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
