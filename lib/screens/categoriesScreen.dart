import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:docleafy/screens/displayPicScreen.dart';
import '../screens/constantsInfo.dart';
import '../static/appBars.dart';
import '../static/scaleTransition.dart';
import '../screens/takePicScreen.dart';
import './constantsInfo.dart';

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
  // void getHttp() async {
  //   try {
  //     Response response =
  //         await Dio().post("https://20.83.176.144:5000/predict-tomato");
  //     print(response);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // fetchInfo() async {
  //   http.Response response =
  //       await http.get("https://20.83.176.144:5000/predict-tomato",
  //       headers: );
  //   print(response.body);

  //   setState(() {
  //     var converted = json.decode(response.body);
  //     print(converted);
  //     //data = converted['disease'];
  //   });
  // }

  @override
  void initState() {
    super.initState();
    //getHttp();
  }

  String _imagePath;
  final picker = ImagePicker();

  Future _getImageFromGallery(int index) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _imagePath = pickedFile.path;
        Navigator.push(
            context,
            ScaleRoute(
                page: DisplayPictureScreen(
              categoryIndex: index,
              imagePath: _imagePath,
            )));
      } else {
        print('No image selected.');
      }
    });
  }

  void _showPicker(context, int index) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _getImageFromGallery(index);
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      Navigator.push(
                          context,
                          ScaleRoute(
                              page: TakePictureScreen(
                            camera: widget.camera,
                            categoryIndex: index,
                          )));
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: appBar(context: context, appBarName: 'Plant Disease Identifier'),
      body: Container(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 3.0,
          ),
          physics: BouncingScrollPhysics(),
          itemCount: plantName.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                print(index);
                _showPicker(context, index);
                //getHttp();

                // Navigator.push(
                //     context,
                //     ScaleRoute(
                //         page: TakePictureScreen(
                //       camera: widget.camera,
                //       categoryIndex: index,
                //     )));
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

                    SizedBox(
                        height: 100.0,
                        width: 100.0,
                        child: Image.asset(plantName[index]["imagePath"])),
                    //Icon(Icons.ac_unit),
                    Text(plantName[index]["name"]),
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
