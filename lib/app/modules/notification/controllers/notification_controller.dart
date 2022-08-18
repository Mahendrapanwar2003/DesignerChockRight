import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_designer_chowk/app/apis/constant/constant_uris.dart';

class NotificationController extends GetxController {
  final count = 0.obs;

  String token = '';

  @override
  void onInit() {
    super.onInit();
    getCallApi();
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

/*  Future<void> callGetApi() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    token = sp.getString('token') ?? "";
    final queryParameters = {
      'blog_id': blog.blogId,
      'language': 'en',
    };
    final uri = Uri.http(
        'dgnchowk.dollopinfotech.com', "/getBlogDetail", queryParameters);
    final res = await http.get(uri, headers: {
      'Authorization': token!,
    });
    if (res.statusCode == 200) {
      Map map = jsonDecode(res.body);
      Map blog = map['blog'];
      GetBlogDetailModel getBlog =
          GetBlogDetailModel.fromJson(jsonDecode(res.body));
      if (getBlog != null) {
        blogDetail.value = getBlog.blog;
        if (getBlog.blog!.comments != null) {
          comments.value = getBlog.blog!.comments!;
        }
      }
      blog_id.value = blog['blog_id'];
      blog_title.value = blog['blog_title'];
      category_id.value = blog['category_id'];
      blog_description.value = blog['blog_description'];
      blog_image.value = blog['blog_image'];
      create_time.value = blog['create_time'];
      is_likes.value = blog['is_likes'];
    }
  }*/

  Future<void> getCallApi() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    token = sp.getString('token') ?? "";
    final queryParameters = {
      'offset': 10,
    };
    final uri = Uri.http(
        'dgnchowk.dollopinfotech.com', "/getNotification", queryParameters);
    final res = await http.get(
      uri,
      headers: {
        'Authorization': token,
      });
    if(res.body==200)
      {
        Map map = jsonDecode(res.body);
        Map NotificationData = map['NotificationData'];
      }
  }
}
