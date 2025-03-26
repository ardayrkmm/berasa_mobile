import 'package:berasa_mobile/tema.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/scan_controller.dart';

class ScanView extends GetView<ScanController> {
  const ScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Obx(() {
        if (!controller.cameraIni.value) {
          return Center(child: CircularProgressIndicator());
        }

        return Stack(
          children: [
            Positioned.fill(
              child: AspectRatio(
                aspectRatio: controller.cameraController!.value.aspectRatio,
                child: CameraPreview(controller.cameraController!),
              ),
            ),
          ],
        );
      }),
    );
  }
}
