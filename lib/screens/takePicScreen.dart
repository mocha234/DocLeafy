import 'dart:async';
import 'package:rive/rive.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

import '../models/predictionModel.dart';
import './displayPicScreen.dart';

class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;
  final int categoryIndex;

  const TakePictureScreen(
      {Key key, @required this.camera, @required this.categoryIndex})
      : super(key: key);

  @override
  _TakePictureScreenState createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen> {
  // void _togglePlay() {
  //   setState(
  //       () => _animationController.isActive = !_animationController.isActive);
  // }

  /// Tracks if the animation is playing by whether controller is running.
  bool get isPlaying => _animationController?.isActive ?? false;
  Artboard _riveArtboard;
  RiveAnimationController _animationController;

  CameraController _controller;
  Future<void> _initializeControllerFuture;
  Future<Predicted> futurePredictions;
  // bool _visible = true;
  String newPath;

  void _appInfo() {
    showDialog(
        //barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "How to use?",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                SizedBox(
                  height: 200.0,
                  width: 200.0,
                  child: Container(
                    child: _riveArtboard == null
                        ? const SizedBox()
                        : Rive(artboard: _riveArtboard),
                  ),
                ),
                Text(
                  "Just take a picture of leaf as clear as possible!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    //futurePredictions = fetchPredictions();
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
    rootBundle.load('assets/animation/howtotakepic.riv').then(
      (data) async {
        final file = RiveFile();

        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard
              .addController(_animationController = SimpleAnimation('howto'));
          setState(() => _riveArtboard = artboard);
        }
      },
    );
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Take a picture of the Leaf"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () {
              _appInfo();
            },
          )
        ],
      ),
      // Wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner
      // until the controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);

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
                  futurePredictions1: futurePredictions,
                  categoryIndex: widget.categoryIndex,
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
