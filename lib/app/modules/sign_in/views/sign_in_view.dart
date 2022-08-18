import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_designer_chowk/app/apis/constant/constant_uris.dart';
import 'package:the_designer_chowk/app/common_methods/common_methods.dart';
import 'package:the_designer_chowk/app/routes/app_pages.dart';
import 'package:the_designer_chowk/app/validation/velidation.dart';
import '../controllers/sign_in_controller.dart';
import 'package:http/http.dart' as http;

class SignInView extends GetView<SignInController> {
  SignInView({Key? key}) : super(key: key);

  final keySignUp = GlobalKey<FormState>();
  final num = TextEditingController();
  final name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(

        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: Form(
                key: keySignUp,
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
                      'Sign In'.tr,
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
                      'Enter phone number'.tr,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    SizedBox(height: size.height * 0.065),
                    TextFormField(
                      controller: name,
                      validator: (value) => Validation.NameValid(Name: value),
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 16,fontFamily: 'GilroyMedium'),
                      decoration: InputDecoration(
                        prefixIcon: CommonWidgets().sizedBox(
                            size: size, icon: Icons.person_outline_rounded),
                        hintText: "Enter your full name".tr,
                        hintStyle: Theme.of(context).textTheme.caption,
                      ),
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: size.height * 0.019),
                    TextFormField(
                      controller: num,
                      maxLength: 10,
                      validator: (value) =>
                          Validation.NumberValid(Number: value),
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 16,fontFamily: 'GilroyMedium'),
                      decoration: InputDecoration(
                          prefixIcon: CommonWidgets().sizedBox(
                              size: size, icon: Icons.phone_android_rounded),
                          hintText: "Enter your number".tr,
                          hintStyle: Theme.of(context).textTheme.caption,
                          counterText: ""),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: size.height * 0.019),
                    Text(
                        '4 digit OTP will be sent via SMS to\nverify your mobile number'
                            .tr,
                        style: Theme.of(context).textTheme.caption),
                    SizedBox(height: size.height * 0.128),
                    ElevatedButton(
                      onPressed: () async {
                        if (keySignUp.currentState!.validate()) {
                          http.Response res = await http.post(
                            Uri.parse(ConstantUris.endpointGetOtp),
                            body: ({
                              "mobile": num.text,
                              "full_name": name.text,
                            }),
                          );
                          if (res.statusCode == 200) {
                            Map value = jsonDecode(res.body);
                            int otp = value["otp"];
                            Get.toNamed(
                              Routes.GET_OTP,
                              arguments: [num.text,name.text],
                            );
                            var snackBar = SnackBar(
                                content: Text(
                                    'OTP Successfully send ${otp.toString()}'
                                        .tr));
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            var snackBar =
                                SnackBar(content: Text('Wrong Information'.tr));
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }
                      },
                      child: Text('Send OTP'.tr,
                          style: Theme.of(context).textTheme.button),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
