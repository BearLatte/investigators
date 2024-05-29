import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investigators/common/common_image.dart';

class CameraTakeView extends StatefulWidget {
  const CameraTakeView({super.key});

  @override
  State<CameraTakeView> createState() => _CameraTakeViewState();
}

class _CameraTakeViewState extends State<CameraTakeView> {
  CameraDescription camera = Get.arguments;
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(camera, ResolutionPreset.veryHigh);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: InkWell(onTap: takePhotoAction, child: const CommonImage(src: 'asset/icons/shutter_icon.png')),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: FutureBuilder(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final size = MediaQuery.of(context).size;
                // 设备像素比
                final double deviceRatio = size.width / size.height;
                // 相机纵横比
                final double aspectRatio = _controller.value.aspectRatio;
                return Stack(children: [
                  Center(child: AspectRatio(aspectRatio: deviceRatio, child: CameraPreview(_controller))),
                  Container(
                    height: 84,
                    width: 84,
                    padding: const EdgeInsets.only(top: 50, right: 20),
                    color: Colors.transparent,
                    child: IconButton(onPressed: Get.back, icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 15,)),
                  )
                ]);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }

  void takePhotoAction() async {
    XFile file = await _controller.takePicture();
    Get.back(result: file.path);
  }
}
