import 'package:get/get.dart';

import '../controllers/get_otp_controller.dart';

class GetOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetOtpController>(
      () => GetOtpController(),
    );
  }
}
