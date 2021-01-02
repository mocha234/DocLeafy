import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

import './albumModel.dart';
import './displayPic.dart';

//import './appBar.dart';

// Mellow Yellow (#FFE77AFF) and Verdant Green (#2C5F2DFF)

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData(
        // Define the default brightness and colors.
        //brightness: Brightness.dark,
        primaryColor:
            //Color(0xFF2C5F2D),
            // Color(0xFF84b37b),
            Color(0xFF688f61),

        accentColor:
            //Color(0xFFe0ca63),
            //Color(0xFFe6d585),
            Color(0xFFEFEFE8),
        //Colors.white,

        // Define the default font family.
        // fontFamily: 'Georgia',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        // textTheme: TextTheme(
        //   headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        //   headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        //bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        // ),
      ),
      home: TakePictureScreen(
        // Pass the appropriate camera to the TakePictureScreen widget.
        camera: firstCamera,
      ),
    ),
  );
}

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;
  Future<Album> futureAlbum;
  bool _visible = true;
  // XFile imageFile;
  String newPath;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    //futureAlbum = fetchAlbum();
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appBar(context),
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Plant Disease Identifier"),
      ),
      // Wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner
      // until the controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            //return CameraPreview(_controller);
///////////////////////////////////////////////////////////////////////////////////

            return new Stack(
              alignment: FractionalOffset.center,
              children: <Widget>[
                new Positioned.fill(
                  child: new AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: new CameraPreview(_controller)),
                ),
                new Positioned.fill(
                  child: Center(
                    child: Opacity(
                      opacity: _visible ? 1.0 : 0.0,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _visible = !_visible;
                          });
                        },
                        child: Image.network(
                          'https://www.clipartmax.com/png/middle/50-501160_leaves-outline-clip-art-clip-art.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );

/////////////////////////////////////////////////////////////////////////////////////
          } else {
            // Otherwise, display a loading indicator.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(
          Icons.camera_alt,
          color: Theme.of(context).primaryColor,
        ),
        // Provide an onPressed callback.
        onPressed: () async {
          //Take the Picture in a try / catch block. If anything goes wrong,
          // catch the error.
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;

            // Construct the path where the image should be saved using the
            // pattern package.
            final path = join(
              // Store the picture in the temp directory.
              // Find the temp directory using the `path_provider` plugin.
              (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );

            // Attempt to take a picture and log where it's been saved.
            await _controller.takePicture(path);
            // If the picture was taken, display it on a new screen.
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  imagePath: path,
                  futureAlbum1: futureAlbum,
                ),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
