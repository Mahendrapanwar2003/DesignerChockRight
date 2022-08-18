import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_designer_chowk/app/apis/constant/constant_uris.dart';
import 'package:the_designer_chowk/app/apis/models/get_blog_detail_model.dart';
import 'package:http/http.dart' as http;

class HomeBlogDetailController extends GetxController {
  final count = 0.obs;
  String? token = '';
  final isLikes = Rxn();
  final sms = TextEditingController();
  final blog = Get.arguments as Blog;
  final comments = <Comments>[].obs;
  final blogDetail = Rxn<Blog>();

  @override
  void onInit() {
    super.onInit();
    callGetApi();
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

  Future<void> callGetApi() async {
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
      isLikes.value = blog['is_likes'];
    }
  }

  sendSmsButton() async {
    FocusManager.instance.primaryFocus!.unfocus();
    SharedPreferences sp = await SharedPreferences.getInstance();
    token = sp.getString('token');
    http.Response res =
        await http.post(Uri.parse(ConstantUris.endpointBlogComments), body: {
      "blog_id": blog.blogId,
      "comment": sms.text
    }, headers: {
      'Authorization': token!,
    });
    if (res.statusCode == 200) {
      callGetApi();
      sms.text = '';
    }
  }

  likeButton() {
    isLikes.value = blogDetail.value?.isLikes;
    if (isLikes.value == '1') {
      isLikes.value = '0';
      likeApiCall();
    } else {
      isLikes.value = '1';
      likeApiCall();
    }
    blogDetail.value?.isLikes = isLikes.value;
  }

  likeApiCall() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    token = sp.getString('token');
    http.Response res =
        await http.post(Uri.parse(ConstantUris.endpointBlogLikes), body: {
      'blog_id': blog.blogId,
    }, headers: {
      'Authorization': token!,
    });
    if (res.statusCode == 200) {
      print('Success');
    }
  }
}
