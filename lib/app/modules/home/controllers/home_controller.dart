import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_designer_chowk/app/apis/constant/constant_uris.dart';
import 'package:the_designer_chowk/app/apis/models/get_blog.dart';
import 'package:the_designer_chowk/app/apis/models/get_blog_detail_model.dart';
import 'package:the_designer_chowk/app/apis/models/getcategorymodel.dart';
import 'package:the_designer_chowk/app/routes/app_pages.dart';
import 'package:the_designer_chowk/app/utils/language_singleton.dart';
import 'package:http/http.dart' as http;

import '../../../data/sheets/selected_locating.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;
  final count = 0.obs;
  final selectedLocation = ''.obs;
  String? token = '';
  final userProfile = ''.obs;
  final notification = ''.obs;

  final list = <Blog>[].obs;
  final homeTab = <Category>[].obs;

  final blogTitle = "".obs;
  final blogImage = "".obs;
  final blogDescription = "".obs;
  final isLikes = Rxn();
  //final List<String> myTabs = <String>[].obs;
  GetCategoryModel getCategory = GetCategoryModel();
  final notificationCountValue = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getBlobApi();
    callApi();
    savedInLocal();
    getCategoryMethod();
  }

  callApi() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    token = sp.getString('token') as String;
    if(token != '') {
      notificationCount(token: token);
      http.Response res = await http.get(
          Uri.parse(ConstantUris.endpointGetUserProfile),
          headers: {'Authorization': token!});
      if (res.statusCode == 200) {
        Map map = jsonDecode(res.body);
        Map<String, dynamic> data = map['user_profile'];
        userProfile.value = data['user_profile'] ?? '';
        notification.value = data['notification'] ?? '';
      } else if (res.statusCode == 401) {
        print("401Unauthorized");
      } else if (res.statusCode == 400) {
        print("400Bad Request");
      }
    }
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

  void savedInLocal() {
    selectedLocation.value = DataSingleton.instance.locationId;
  }

  clickProfile() async {
    await Get.toNamed(Routes.PROFILE);
    callApi();
  }

  Future<void> getBlobApi() async {
    http.Response res = await http.get(Uri.parse(ConstantUris.endpointGetBlog));
    if (res.statusCode == 200) {
      GetBlog getBlog = GetBlog.fromJson(jsonDecode(res.body));
      if (getBlog.blog != null) {
        list.value = getBlog.blog!;
      }
    }
  }

  getCategoryMethod() async {
    http.Response res =
        await http.get(Uri.parse(ConstantUris.endpointGetCategory));
    if (res.statusCode == 200) {
      getCategory = GetCategoryModel.fromJson(jsonDecode(res.body));
      if (getCategory.category != null) {
        homeTab.value = getCategory.category!;
        tabController = TabController(
          vsync: this,
          length: homeTab.length,
        );
      }
    }
  }

  clickOnNotification() {
    Get.toNamed(Routes.NOTIFICATION);
  }

  clickOnLocationButton() {
    savedInLocal();
    showModalBottomSheet(
      context: Get.context!,
      builder: (context) {
        return SizedBox(
          height: 300,
          width: double.infinity,
          child: Obx(() => SelectedLocation(
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

  Future<void> notificationCount({String? token}) async {
    http.Response res = await http.get(Uri.parse(ConstantUris.endpointGetUserCountUnreadNotification),headers: {'Authorization' : token!});
    if (res.statusCode == 200) {
      notificationCountValue.value = int.parse(jsonDecode(res.body)["UnreadCount"]);
    }
  }
}
