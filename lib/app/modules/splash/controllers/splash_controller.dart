import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_designer_chowk/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    moveToSignIn();
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

  void moveToSignIn() async {
    await Future.delayed(const Duration(seconds: 2));
    var sp = await SharedPreferences.getInstance();
    String? name = null;
    name = sp.getString('full_name');
    if (name == null || name == '') {
      Get.offNamed(Routes.SIGN_IN);
    } else {
      Get.offNamed(Routes.HOME);
    }
  }
}
