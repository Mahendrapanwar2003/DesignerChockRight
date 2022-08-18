import 'package:get/get.dart';

class GetOtpController extends GetxController {
  final count = 0.obs;
  final num = Get.arguments[0] as String;
  final name = Get.arguments[1] as String;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
