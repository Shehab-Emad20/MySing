import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mikhail_samuel/main.dart';
import 'package:tflite/tflite.dart';

class TranslateHome extends StatefulWidget {
  const TranslateHome({super.key});

  @override
  State<TranslateHome> createState() => _TranslateHomeState();
}

class _TranslateHomeState extends State<TranslateHome> {
  bool isCameraInitialized = false;
  late CameraController cameraController;

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/labels.txt",
    );
  }

  void initCamera() async {
    cameraController = CameraController(
      cameras[0],
      ResolutionPreset.high,
      enableAudio: false,
    );

    try {
      await cameraController.initialize();
      if (!mounted) return;
      setState(() {
        isCameraInitialized = true;
      });
    } catch (e) {
      debugPrint("Error initializing camera: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  @override
  void dispose() async {
    if (isCameraInitialized) {
      await cameraController.dispose();
    }
    await Tflite.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isCameraInitialized) {
          initCamera();
        }
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child:
            isCameraInitialized && cameraController.value.isInitialized
                ? AspectRatio(
                  aspectRatio: cameraController.value.aspectRatio,
                  child: CameraPreview(cameraController),
                )
                : const Center(
                  child: Text(
                    'اضغط لتشغيل الكاميرا',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
      ),
    );
  }
}
