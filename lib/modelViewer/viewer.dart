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
      body: const ModelViewer(
        backgroundColor: Colors.black,
        src: 'assets/tool.glb',
        alt: "3D model specific tool",
        autoPlay: true,
        autoRotate: true,
        cameraControls: true,
      ),
    );
  }
}
