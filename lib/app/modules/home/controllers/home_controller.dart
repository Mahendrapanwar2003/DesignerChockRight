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

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController? controller;
  final count = 0.obs;
  final selectedLocation = ''.obs;

  String? token = '';
  final user_profile = ''.obs;

  final list = <Blog>[].obs;
  final homeTab = <Category>[].obs;

  final blog_title = "".obs;
  final blog_image = "".obs;
  final blog_description = "".obs;
  final is_likes = Rxn();
  final List<Tab> myTabs = <Tab>[].obs;

  @override
  void onInit() {
    super.onInit();
    getBlobApi();
    callApi();
    savedInLocal();
    GetCategory();
  }

  callApi() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    token = sp.getString('token') as String;
    print(token);
    http.Response res = await http.get(
        Uri.parse(ConstantUris.endpointGetUserProfile),
        headers: {'Authorization': token!});
    if (res.statusCode == 200) {
      Map map = jsonDecode(res.body);
      Map<String, dynamic> data = map['user_profile'];
      user_profile.value = data['user_profile'] ?? '';
      print(data['user_id']);
    } else if (res.statusCode == 401) {
      print("401Unauthorized");
    } else if (res.statusCode == 400) {
      print("400Bad Request");
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
    } else {
      print('Fail');
    }
  }

  GetCategory() async {
    http.Response res =
        await http.get(Uri.parse(ConstantUris.endpointGetCategory));
    if (res.statusCode == 200) {
      GetCategoryModel getCategory =
      GetCategoryModel.fromJson(jsonDecode(res.body));
      print(getCategory.category);
      if (getCategory.category != null) {
        homeTab.value = getCategory.category!;
        print(homeTab.length);
        homeTab.value.forEach((element) {
          Tab tab = Tab(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          ConstantUris.baseUrl + element.categoryImage!),
                    ),
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                Text(element.categoryName!),
              ],
            ),
          );
          myTabs.add(tab);
        });
        print('hfdgshgfdvgysvtyvfdgsvdgf');
        myTabs.length = homeTab.length;
        count.value=myTabs.length;
        controller = TabController(
          vsync: this,
          length: myTabs.length,
        );
      }
    } else {
      print('Fail');
    }
  }
}
