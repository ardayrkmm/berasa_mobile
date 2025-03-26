import 'package:get/get.dart';
import 'package:camera/camera.dart';

class ScanController extends GetxController {
  //TODO: Implement ScanController
  CameraController? cameraController;
  RxBool cameraIni = false.obs;
  RxString urlgambar = ''.obs;

  Future<void> initCamera() async {
    final camera = await availableCameras();
    if (camera.isNotEmpty) {
      cameraController = CameraController(camera[0], ResolutionPreset.medium);
      await cameraController!.initialize();
      cameraIni.value = true;
    } else {
      Get.snackbar("Error", "Kamera tidak ditemukan");
    }
  }

  Future<void> takePicture() async {
    if (cameraController != null && cameraController!.value.isInitialized) {
      final XFile file = await cameraController!.takePicture();
      urlgambar.value = file.path;
    }
  }

  @override
  void onInit() {
    initCamera();
    super.onInit();
  }

  @override
  void onClose() {
    cameraController?.dispose();
    super.onClose();
  }
}
