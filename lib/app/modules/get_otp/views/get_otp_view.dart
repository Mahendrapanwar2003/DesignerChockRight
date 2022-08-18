import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_designer_chowk/app/apis/constant/constant_uris.dart';
import 'package:the_designer_chowk/app/routes/app_pages.dart';
import '../controllers/get_otp_controller.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class GetOtpView extends GetView<GetOtpController> {
  GetOtpView({Key? key}) : super(key: key);
  final otpKey = GlobalKey<FormState>();
  final pin = TextEditingController();
  String currentText = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
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
                key: otpKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset('assets/images/designer-chowk-logo_eng.png',
                            width: size.width * .18, height: size.height * .15)
                      ],
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text('Get OTP'.tr,
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline1),
                    SizedBox(height: size.height * 0.00001),
                    Divider(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .secondary,
                      thickness: 2,
                      endIndent: size.width * .84,
                    ),
                    SizedBox(height: size.height * 0.012),
                    Text('Enter the OTP you received to'.tr,
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyText1),
                    SizedBox(height: size.height * 0.005),
                    Text('+91 ${controller.num}',
                        style: Theme
                            .of(context)
                            .textTheme
                            .subtitle1),
                    SizedBox(height: size.height * 0.03),
                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: size.width * 0.03),
                      child: PinCodeTextField(
                        autoUnfocus: true,
                        controller: pin,
                        //validator: (value)=>Validation.Pin(pin: value),
                        appContext: context,
                        pinTheme: PinTheme(
                          inactiveColor: Theme
                              .of(context)
                              .colorScheme
                              .outline,
                          inactiveFillColor:
                          Theme
                              .of(context)
                              .colorScheme
                              .outline,
                          activeColor: Theme
                              .of(context)
                              .colorScheme
                              .outline,
                          activeFillColor:
                          Theme
                              .of(context)
                              .colorScheme
                              .outline,
                          selectedColor:
                          Theme
                              .of(context)
                              .colorScheme
                              .secondary,
                          selectedFillColor:
                          Theme
                              .of(context)
                              .colorScheme
                              .outline,
                          shape: PinCodeFieldShape.box,
                          fieldWidth: size.width * 0.18,
                          fieldHeight: size.height * 0.08,
                          borderWidth: 0.50,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enableActiveFill: true,
                        cursorColor: Theme
                            .of(context)
                            .colorScheme
                            .secondary,
                        keyboardType: TextInputType.number,
                        textStyle: Theme
                            .of(context)
                            .textTheme
                            .subtitle2
                            ?.copyWith(color: Colors.black),
                        length: 4,
                        onChanged: (String value) => currentText = value,
                      ),
                    ),
                    SizedBox(height: size.height * 0.08),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "If you didn't receive a code! ".tr,
                          style: Theme
                              .of(context)
                              .textTheme
                              .caption,
                        ),
                        TextButton(
                          onPressed: () async {
                            pin.text = '';
                            http.Response res = await http.post(
                              Uri.parse(ConstantUris.endpointGetOtp),
                              body: ({
                                "mobile": controller.num,
                                "full_name": controller.name,
                              }),
                            );
                            if (res.statusCode == 200) {
                              Map value = jsonDecode(res.body);
                              // ignore: use_build_context_synchronously
                              MotionToast.info(
                                title: const Text(
                                  'Your OTP is ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                description: Text("${value["otp"]}"),
                              ).show(context);
                            }
                          },
                          child: Text('Resend'.tr),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        http.Response res = await http.post(
                            Uri.parse(ConstantUris.endpointMatchOtp),
                            body: {
                              'mobile': controller.num,
                              'otp': pin.text,
                            });
                        if (pin.text.length == 4) {
                          if (res.statusCode == 200) {
                            Map value = jsonDecode(res.body);
                            Map data = value['match_otp_data'];
                            Get.offAllNamed(Routes.HOME);
                            var sp =
                            await SharedPreferences.getInstance();
                            sp.setString('mobile', data['mobile']);
                            sp.setString('email', data['email']);
                            sp.setString('full_name', data['full_name']);
                            sp.setString('token', data['token']);
                            print(data['token']);
                            // ignore: use_build_context_synchronously
                            MotionToast.success(
                              title: Text(
                                'Successfully Login'.tr,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              description:
                              Text('Wellcome to Disigner Chock'.tr),
                            ).show(context);
                          } else {
                            // ignore: use_build_context_synchronously
                            MotionToast.error(
                              title: Text(
                                'Not Match Enter Again'.tr,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              description: const Text(''),
                            ).show(context);
                          }
                        } else if (pin.text.isEmpty) {
                          // ignore: use_build_context_synchronously
                          MotionToast.error(
                            title: Text(
                              'Please Enter pin'.tr,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            description: const Text(''),
                          ).show(context);
                        } else if (pin.text.length != 4) {
                          // ignore: use_build_context_synchronously
                          MotionToast.error(
                            title: Text(
                              'Please Enter Valid 4 Digit Pin'.tr,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            description: const Text(''),
                          ).show(context);
                        }
                      },
                      child: Text('Verify'.tr,
                          style: Theme
                              .of(context)
                              .textTheme
                              .button),
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
