import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size  = MediaQuery.of(context).size;
    return Obx(
      () => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/designer-chowk-logo_eng.png',width: size.width * .5,height: size.height * .5),
              // ignore: unrelated_type_equality_checks
              Text(('${controller.count.value}'==0) ? '':''),
            ],
          ),
        ),
      ),
    );
  }
}
