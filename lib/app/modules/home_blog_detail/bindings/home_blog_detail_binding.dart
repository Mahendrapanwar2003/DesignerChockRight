import 'package:get/get.dart';

import '../controllers/home_blog_detail_controller.dart';

class HomeBlogDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeBlogDetailController>(
      () => HomeBlogDetailController(),
    );
  }
}
