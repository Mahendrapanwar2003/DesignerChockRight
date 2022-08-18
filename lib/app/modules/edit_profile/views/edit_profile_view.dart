import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_designer_chowk/app/apis/constant/constant_uris.dart';
import 'package:the_designer_chowk/app/validation/velidation.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  var profileFormKey = GlobalKey<FormState>();

  EditProfileView({Key? key}) : super(key: key);

  ImageProvider showProfilePic() {
    if (controller.img.value != null) {
      return FileImage(File(controller.img.value!.path));
    }
    if (controller.user_profile.isNotEmpty) {
      return NetworkImage(ConstantUris.baseUrl + controller.user_profile.value);
    }
    return const AssetImage("assets/images/image.png");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0.4,
          title: Text(
            'Edit Profile'.tr,
            style:
                Theme.of(context).textTheme.headline2?.copyWith(fontSize: 19),
          ),
        ),
        body: ListView(
          children: [
            SizedBox(height: size.height * .02),
            Form(
              key: profileFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: size.width * .35,
                        width: size.height * .35,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.primary,
                            border: Border.all(
                                width: 1,
                                color: Theme.of(context).colorScheme.secondary),
                            image: DecorationImage(
                                image: showProfilePic(), fit: BoxFit.cover)),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.camera_alt,
                          color: Theme.of(context).colorScheme.background,
                        ),
                        onPressed: () => controller.clickCamera(context),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * .04),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        controller.full_name.value,
                        style: Theme.of(context).textTheme.headline2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * .0086),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(controller.email.value,
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            ?.copyWith(fontFamily: 'GilroySemiBold', fontSize: 12),
                        overflow: TextOverflow.ellipsis),
                  ),
                  SizedBox(height: size.height * .055),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Full Name'.tr,
                            style: Theme.of(context).textTheme.caption),
                        TextField(
                          controller: controller.name,
                          style: Theme.of(context).textTheme.subtitle2?.copyWith(
                              fontSize: 16, fontFamily: 'GilroyMedium'),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 18),
                              hintText: "Enter your full name".tr,
                              hintStyle: Theme.of(context).textTheme.caption,
                          ),
                          keyboardType: TextInputType.name,
                        ),
                        SizedBox(height: size.height * 0.03),
                        Text('User Email'.tr,
                            style: Theme.of(context).textTheme.caption,
                            overflow: TextOverflow.ellipsis),
                        SizedBox(height: size.height * 0.007),
                        TextFormField(
                          controller: controller.emailE,
                          validator: (value)=>Validation.EmailValid(email: controller.emailE.text),
                          style: Theme.of(context).textTheme.subtitle2?.copyWith(
                              fontSize: 16, fontFamily: 'GilroyMedium'),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 18),
                            hintStyle: Theme.of(context).textTheme.caption,
                              hintText: "@adnankhan487@gmai.com",
                            ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: size.height * 0.03),
                        Text('Mobile Number'.tr,
                            style: Theme.of(context).textTheme.caption,
                            overflow: TextOverflow.ellipsis),
                        SizedBox(height: size.height * 0.007),
                        TextField(
                          controller: controller.mobileN,
                          readOnly: true,
                          style: Theme.of(context).textTheme.subtitle2?.copyWith(
                              fontSize: 16, fontFamily: 'GilroyMedium'),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 18),
                              hintStyle: Theme.of(context).textTheme.caption,
                              suffixIcon: const Icon(
                                Icons.verified,
                              ),
                              hintText: "+91 82654 56849",
                              counterText: ''),
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                        ),
                        SizedBox(height: size.height * 0.125),
                        ElevatedButton(
                          onPressed: () {
                            if(profileFormKey.currentState!.validate())
                            {
                              controller.updateProfile(context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 52),
                          ),
                          child: Text(
                            'SAVE PROFILE'.tr,
                            style: Theme.of(context).textTheme.button,
                          ),
                        ),
                        SizedBox(height: size.height * .02),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
