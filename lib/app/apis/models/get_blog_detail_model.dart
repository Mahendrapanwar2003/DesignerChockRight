class GetBlogDetailModel {
  String? message;
  Blog? blog;

  GetBlogDetailModel({this.message, this.blog});

  GetBlogDetailModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    blog = json['blog'] != null ? new Blog.fromJson(json['blog']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.blog != null) {
      data['blog'] = this.blog!.toJson();
    }
    return data;
  }
}

class Blog {
  String? blogId;
  String? cityIds;
  String? categoryId;
  String? blogTitle;
  String? blogDescription;
  String? blogImage;
  String? isActive;
  String? createDate;
  String? createTime;
  String? isLikes;
  String? likeCount;
  List<Comments>? comments;

  Blog(
      {this.blogId,
      this.cityIds,
      this.categoryId,
      this.blogTitle,
      this.blogDescription,
      this.blogImage,
      this.isActive,
      this.createDate,
      this.createTime,
      this.isLikes,
      this.likeCount,
      this.comments});

  Blog.fromJson(Map<String, dynamic> json) {
    blogId = json['blog_id'];
    cityIds = json['cityIds'];
    categoryId = json['category_id'];
    blogTitle = json['blog_title'];
    blogDescription = json['blog_description'];
    blogImage = json['blog_image'];
    isActive = json['is_active'];
    createDate = json['create_date'];
    createTime = json['create_time'];
    isLikes = json['is_likes'];
    likeCount = json['like_count'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blog_id'] = this.blogId;
    data['cityIds'] = this.cityIds;
    data['category_id'] = this.categoryId;
    data['blog_title'] = this.blogTitle;
    data['blog_description'] = this.blogDescription;
    data['blog_image'] = this.blogImage;
    data['is_active'] = this.isActive;
    data['create_date'] = this.createDate;
    data['create_time'] = this.createTime;
    data['is_likes'] = this.isLikes;
    data['like_count'] = this.likeCount;
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comments {
  String? commentId;
  String? blogId;
  String? userId;
  String? comment;
  String? createdAt;
  String? fullName;
  String? email;
  String? userProfile;
  String? createDate;
  String? createTime;
  String? isLikes;
  String? likeCount;

  Comments(
      {this.commentId,
      this.blogId,
      this.userId,
      this.comment,
      this.createdAt,
      this.fullName,
      this.email,
      this.userProfile,
      this.createDate,
      this.createTime,
      this.isLikes,
      this.likeCount});

  Comments.fromJson(Map<String, dynamic> json) {
    commentId = json['comment_id'];
    blogId = json['blog_id'];
    userId = json['user_id'];
    comment = json['comment'];
    createdAt = json['created_at'];
    fullName = json['full_name'];
    email = json['email'];
    userProfile = json['user_profile'];
    createDate = json['create_date'];
    createTime = json['create_time'];
    isLikes = json['is_likes'];
    likeCount = json['like_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment_id'] = this.commentId;
    data['blog_id'] = this.blogId;
    data['user_id'] = this.userId;
    data['comment'] = this.comment;
    data['created_at'] = this.createdAt;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['user_profile'] = this.userProfile;
    data['create_date'] = this.createDate;
    data['create_time'] = this.createTime;
    data['is_likes'] = this.isLikes;
    data['like_count'] = this.likeCount;
    return data;
  }
}
