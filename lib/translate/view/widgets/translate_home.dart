import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class TranslateHome extends StatefulWidget {
  const TranslateHome({super.key});

  @override
  State<TranslateHome> createState() => _TranslateHomeState();
}

class _TranslateHomeState extends State<TranslateHome> {
  bool isCameraInitialized = false;
  bool isWorking = false;
  CameraImage? ingCamera;
  late CameraController cameraController;
  String result = "";

  loadModel() async {
    try {
      await Tflite.loadModel(
        model: "assets/model.tflite",
        labels: "assets/labels.txt",
      );
    } catch (e) {
      debugPrint("Error loading model: $e");
    }
  }

  void initCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        debugPrint("No cameras available");
        return;
      }

      cameraController = CameraController(
        cameras[0],
        ResolutionPreset.high,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.yuv420,
      );

      await cameraController.initialize();
      if (!mounted) return;

      setState(() {
        isCameraInitialized = true;
      });

      cameraController.startImageStream((imageFromStream) {
        if (!isWorking) {
          isWorking = true;
          ingCamera = imageFromStream;
          runModelOnStreamFrames();
        }
      });
    } catch (e) {
      debugPrint("Error initializing camera: $e");
    }
  }

  runModelOnStreamFrames() async {
    if (ingCamera != null) {
      try {
        var recognitions = await Tflite.runModelOnFrame(
          bytesList: ingCamera!.planes.map((plane) => plane.bytes).toList(),
          imageHeight: ingCamera!.height,
          imageWidth: ingCamera!.width,
          imageMean: 127.5,
          imageStd: 127.5,
          rotation: 90,
          numResults: 2,
          threshold: 0.1,
          asynch: true,
        );

        if (recognitions != null) {
          result = "";
          for (var response in recognitions) {
            result +=
                "${response["label"]}  ${(response["confidence"] as double).toStringAsFixed(2)}\n\n";
          }
          if (mounted) {
            setState(() {});
          }
        }
      } catch (e) {
        debugPrint("Error running model: $e");
      }
      isWorking = false;
    }
  }

  @override
  void initState() {
    super.initState();
    loadModel();
  }

  @override
  void dispose() {
    try {
      Tflite.close();
      cameraController.dispose();
    } catch (e) {
      debugPrint("Error in dispose: $e");
    }
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
                ? Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: cameraController.value.aspectRatio,
                      child: CameraPreview(cameraController),
                    ),
                    if (result.isNotEmpty)
                      Positioned(
                        bottom: 10,
                        left: 10,
                        right: 10,
                        child: Text(
                          result,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            backgroundColor: Colors.black54,
                          ),
                        ),
                      ),
                  ],
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
