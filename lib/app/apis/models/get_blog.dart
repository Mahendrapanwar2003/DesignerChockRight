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
        blog!.add(new Blog.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.blog != null) {
      data['blog'] = this.blog!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
