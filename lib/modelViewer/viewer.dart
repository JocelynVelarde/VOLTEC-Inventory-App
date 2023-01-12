import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class Viewer extends StatefulWidget {
  const Viewer({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ViewerState createState() => _ViewerState();
}

class _ViewerState extends State<Viewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("3D Model Viewer"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      body: ModelViewer(
        backgroundColor: Colors.black,
        src:
            'https://sketchfab.com/3d-models/joystick-bea744ca5a03497d81a9e767ad89d297?utm_medium=embed&utm_campaign=share-popup&utm_content=bea744ca5a03497d81a9e767ad89d297',
        alt: "A 3D model of a star destroyer",
        autoPlay: true,
        autoRotate: true,
        cameraControls: true,
      ),
    );
  }
}
