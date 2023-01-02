import 'package:the_designer_chowk/app/apis/models/get_blog_detail_model.dart';

class GetBlog {
  String? message;
  List<Blog>? blog;

  GetBlog({this.message, this.blog});

  GetBlog.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['blog'] != null) {
      blog = <Blog>[];
      json['blog'].forEach((v) {
        blog!.add(Blog.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    if (blog != null) {
      data['blog'] = blog!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
