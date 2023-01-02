import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_designer_chowk/app/apis/constant/constant_uris.dart';
import 'package:the_designer_chowk/app/routes/app_pages.dart';
import 'package:the_designer_chowk/app/utils/language_singleton.dart';
import 'package:http/http.dart' as http;

import '../../../data/sheets/selected_language.dart';
import '../../../data/sheets/selected_locating.dart';

class ProfileController extends GetxController {
  final count = 0.obs;
  final notificationOn = false.obs;
  final selectedLanguage = ''.obs;
  final selectedLocation = ''.obs;

  final full_name = ''.obs;
  final user_profile = ''.obs;
  final mobile = ''.obs;
  final email = ''.obs;
  String? token = '';

  final notification = ''.obs;
  final notificationCountValue = 0.obs;

  @override
  void onInit() {
    super.onInit();
    savedInLocal();
    callApi();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void savedInLocal() {
    selectedLocation.value = DataSingleton.instance.locationId;
    selectedLanguage.value = DataSingleton.instance.languageId;
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void language(String value) => selectedLanguage.value = value;

  void location(String value) => selectedLocation.value = value;

  callApi() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    token = sp.getString('token') as String;
    if(token!='')
      {
        notificationCount(token: token);
      }
    http.Response res = await http.get(
        Uri.parse(ConstantUris.endpointGetUserProfile),
        headers: {'Authorization': token!});
    if (res.statusCode == 200) {
      Map map = jsonDecode(res.body);
      Map<String, dynamic> data = map['user_profile'];
      full_name.value = data['full_name'];
      email.value = data['email'] ?? "";
      mobile.value = data['mobile'];
      user_profile.value = data['user_profile'] ?? '';
      notification.value = data['notification'] ?? '';
      if(notification.value =='')
        {
          notificationOn.value =false;
        }else
          {
            notificationOn.value = true;
          }
    } else if (res.statusCode == 401) {
      print("401Unauthorized");
    } else if (res.statusCode == 400) {
      print("400Bad Request");
    }
  }

  Future<void> notificationCount({String? token}) async {
    http.Response res = await http.get(Uri.parse(ConstantUris.endpointGetUserCountUnreadNotification),headers: {'Authorization' : token!});
    if (res.statusCode == 200) {
      notificationCountValue.value = int.parse(jsonDecode(res.body)["UnreadCount"]);
    }
  }

  dataUpdateProfile() async {
    await Get.toNamed(Routes.EDIT_PROFILE);
    callApi();
  }

  clickOnNotification() {
    Get.toNamed(Routes.NOTIFICATION);
  }
  clickOnLanguageTile() {
    savedInLocal();
    showModalBottomSheet(
        context: Get.context!,
        builder: (context) {
          return SizedBox(
            height: 300,
            width: double.infinity,
            child: Obx(
                  () {return SelectedLanguagePage(
                  selectedLanguage:
                  selectedLanguage.value,
                  onPressed: () {}, changeLanguage: (String value) { selectedLanguage(value); },
                );
              },
            ),
          );
        });
  }

  clickOnLocationTile() {
    savedInLocal();
    showModalBottomSheet(
      context: Get.context!,
      builder: (context) {
        return SizedBox(
          height: 300,
          width: double.infinity,
          child: Obx(
                () => SelectedLocation(
              selectedLocation:
              selectedLocation.value,
              changeLocation: (String value) {
                selectedLocation(value);
              },
              onPressed: () {},
            ),
          ),
        );
      },
    );
  }

}
