import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_designer_chowk/app/apis/constant/constant_uris.dart';
import 'package:the_designer_chowk/app/data/sheets/selected_language.dart';
import 'package:the_designer_chowk/app/data/sheets/selected_locating.dart';
import 'package:the_designer_chowk/app/routes/app_pages.dart';
import 'package:the_designer_chowk/app/utils/language_singleton.dart';
import '../controllers/profile_controller.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);

  ImageProvider showProfilePic() {
    if (controller.user_profile.isNotEmpty) {
      return NetworkImage(ConstantUris.baseUrl + controller.user_profile.value);
    }
    return const AssetImage("assets/images/image.png");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.height * .48);
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0.4,
          title: Text('Profile'.tr,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(fontSize: 19)),
          actions: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.NOTIFICATION);
                  },
                  icon: const Icon(Icons.notifications_none_rounded),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 14,
                    width: 14,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '2',
                        style: Theme.of(context).textTheme.headline2?.copyWith(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 10,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus!.unfocus();
          },
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    tileColor: Theme.of(context).colorScheme.background,
                    iconColor: Theme.of(context).colorScheme.onBackground,
                    trailing: IconButton(
                      onPressed: controller.dataUpdateProfile,
                      icon: Icon(Icons.edit_outlined),
                    ),
                    title: Text(
                      controller.full_name.value,
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          ?.copyWith(fontWeight: FontWeight.w200),
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(controller.email.value,
                        style: Theme.of(context).textTheme.caption?.copyWith(
                            fontFamily: 'GilroySemiBold', fontSize: 12),
                        overflow: TextOverflow.ellipsis),
                    leading: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.primary,
                        border: Border.all(
                            width: 1,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.primary,
                            border: Border.all(
                                width: 1,
                                color: Theme.of(context).colorScheme.secondary),
                            image: DecorationImage(
                                image: showProfilePic(), fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.height * 0.019,
                        vertical: size.width * 0.01),
                    child: Text('General'.tr,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(fontSize: 14)),
                  ),
                  ListTile(
                    /*onTap: () {
                      */ /*showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const SizedBox(
                              height: 300,
                              width: double.infinity,
                              child: SendRequest());
                        },
                      );*/ /*
                    },*/
                    tileColor: Theme.of(context).colorScheme.background,
                    title: Text('Mobile Number'.tr,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(fontSize: 14)),
                    subtitle: Text('+91 ${controller.mobile.value}',
                        style: Theme.of(context).textTheme.caption?.copyWith(
                            fontFamily: 'GilroySemiBold', fontSize: 12),
                        overflow: TextOverflow.ellipsis),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.height * 0.019,
                        vertical: size.width * 0.01),
                    child: Text(
                      'Account'.tr,
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          ?.copyWith(fontSize: 14),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      controller.savedInLocal();
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: 300,
                            width: double.infinity,
                            child: Obx(
                              () => SelectedLocation(
                                selectedLocation:
                                    controller.selectedLocation.value,
                                changeLocation: (String value) {
                                  controller.selectedLocation(value);
                                  DataSingleton.instance.locationId = value;
                                },
                                onPressed: () {},
                              ),
                            ),
                          );
                        },
                      );
                    },
                    tileColor: Theme.of(context).colorScheme.background,
                    iconColor: Theme.of(context).colorScheme.onBackground,
                    trailing: Image.asset(
                      'assets/images/arrow_right.png',
                      height: size.height * .024,
                      width: size.height * .024,
                    ),
                    title: Text('Create Blog'.tr,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(fontSize: 14)),
                    subtitle: Text(
                        'Send a request to admin to create a blog'.tr,
                        style: Theme.of(context).textTheme.caption?.copyWith(
                            fontFamily: 'GilroySemiBold', fontSize: 12),
                        overflow: TextOverflow.ellipsis),
                    leading: Container(
                      height: size.height * .06,
                      width: size.height * .06,
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.08),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Image.asset(
                          'assets/images/edit.png',
                          height: size.height * .024,
                          width: size.height * .024,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      controller.savedInLocal();
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return SizedBox(
                              height: 300,
                              width: double.infinity,
                              child: Obx(
                                () => SelectedLanguagePage(
                                  selectedLanguage:
                                      controller.selectedLanguage.value,
                                  changeLanguage: (String value) {
                                    controller.selectedLanguage(value);
                                    DataSingleton.instance.languageId = value;
                                  },
                                  onPressed: () {
                                    print(
                                        "object:: ${controller.selectedLanguage.value}");
                                  },
                                ),
                              ),
                            );
                          });
                    },
                    tileColor: Theme.of(context).colorScheme.background,
                    iconColor: Theme.of(context).colorScheme.onBackground,
                    trailing: Image.asset(
                      'assets/images/arrow_right.png',
                      height: size.height * .024,
                      width: size.height * .024,
                    ),
                    title: Text('My Posts'.tr,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(fontSize: 14)),
                    subtitle: Text(
                        'Send a request to admin to create a blog'.tr,
                        style: Theme.of(context).textTheme.caption?.copyWith(
                            fontFamily: 'GilroySemiBold', fontSize: 12),
                        overflow: TextOverflow.ellipsis),
                    leading: Container(
                      height: size.height * .06,
                      width: size.height * .06,
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.08),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8))),
                      child: Center(
                        child: Image.asset(
                          'assets/images/picture.png',
                          height: size.height * .024,
                          width: size.height * .024,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.height * 0.019,
                        vertical: size.width * 0.01),
                    child: Text('Settings'.tr,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(fontSize: 14)),
                  ),
                  ListTile(
                    onTap: () {},
                    tileColor: Theme.of(context).colorScheme.background,
                    iconColor: Theme.of(context).colorScheme.onBackground,
                    trailing: Container(
                      width: size.width * .1,
                      height: size.height * .1,
                      child: Center(
                        child: FlutterSwitch(
                          width: size.width * .1,
                          height: size.height * .028,
                          toggleSize: size.width * .03,
                          activeToggleColor:
                              Theme.of(context).colorScheme.background,
                          activeColor: Theme.of(context).colorScheme.secondary,
                          value: controller.notificationOn.value,
                          onToggle: (value) {
                            controller.notificationOn.value = value;
                          },
                        ),
                      ),
                    ),
                    title: Text('Notification'.tr,
                        style: Theme.of(context)
                            .textTheme
                            .headline2
                            ?.copyWith(fontSize: 14)),
                    leading: Container(
                      height: size.height * .06,
                      width: size.height * .06,
                      decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.08),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Image.asset(
                          'assets/images/notifications.png',
                          height: size.height * .024,
                          width: size.height * .024,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.019,
                  ),
                  ListTile(
                    onTap: () {
                      AlertDialog alert = AlertDialog(
                        title: Text("THE DESIGNER CHOWK".tr),
                        content: Text('Are you sure to logout'.tr),
                        actions: [
                          TextButton(
                              onPressed: () async {
                                Get.offAllNamed(Routes.SIGN_IN);
                                SharedPreferences sp =
                                    await SharedPreferences.getInstance();
                                sp.setString('mobile', '');
                                sp.setString('email', '');
                                sp.setString('full_name', '');
                                sp.setString('token', '');
                              },
                              child: Text('LOGOUT'.tr)),
                          TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text('CANCEL'.tr)),
                        ],
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    },
                    tileColor: Theme.of(context).colorScheme.background,
                    title: Text('Sign out your account'.tr,
                        style: Theme.of(context).textTheme.caption?.copyWith(
                            fontFamily: 'GilroyMedium', fontSize: 16),
                        overflow: TextOverflow.ellipsis),
                    trailing: Image.asset(
                      'assets/images/sign-out-alt.png',
                      height: size.height * .024,
                      width: size.height * .024,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
