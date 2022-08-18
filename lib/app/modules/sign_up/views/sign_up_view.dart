import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:the_designer_chowk/app/common_methods/common_methods.dart';
import 'package:the_designer_chowk/app/routes/app_pages.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: InkWell(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        splashColor: Colors.transparent,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset('assets/images/designer-chowk-logo_eng.png',
                          width: size.width * .18, height: size.height * .15),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    'Sign Up'.tr,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(height: size.height * 0.00001),
                  Divider(
                    color: Theme.of(context).colorScheme.secondary,
                    thickness: 2,
                    endIndent: size.width * .84,
                  ),
                  SizedBox(height: size.height * 0.012),
                  Text(
                    'Create your account'.tr,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(height: size.height * 0.065),
                  TextField(
                    maxLength: 10,
                    style: Theme.of(context).textTheme.caption,
                    decoration: InputDecoration(
                      prefixIcon: CommonWidgets().sizedBox(
                          size: size, icon: Icons.phone_android_rounded),
                      hintText: "Enter your number".tr,
                      counterText: ""
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: size.height * 0.019),
                  TextField(
                    style: Theme.of(context).textTheme.caption,
                    decoration: InputDecoration(
                      prefixIcon: CommonWidgets().sizedBox(
                          size: size, icon: Icons.mail_outline_rounded),
                      hintText: "Enter your email id".tr,
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: size.height * 0.019),
                  TextField(
                    style: Theme.of(context).textTheme.caption,
                    decoration: InputDecoration(
                      prefixIcon: CommonWidgets().sizedBox(
                          size: size, icon: Icons.person_outline_rounded),
                      hintText: "Enter your full name".tr,
                    ),
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: size.height * 0.125),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ".tr,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offAllNamed(Routes.SIGN_IN);
                        },
                        child: Text('Sign In'.tr),
                      ),
                    ],
                  ),

                  ElevatedButton(
                    onPressed: () {
                      Get.offNamed(Routes.SIGN_IN);
                    },
                    child: Text(
                      'Submit'.tr,
                      style: Theme.of(context).textTheme.button,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
