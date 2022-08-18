class GetCategoryModel {
  String? message;
  List<Category>? category;

  GetCategoryModel({this.message, this.category});

  GetCategoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  String? categoryId;
  String? categoryName;
  String? categoryNameHi;
  String? categoryImage;
  String? isActive;

  Category(
      {this.categoryId,
        this.categoryName,
        this.categoryNameHi,
        this.categoryImage,
        this.isActive});

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryNameHi = json['category_name_hi'];
    categoryImage = json['CategoryImage'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['category_name_hi'] = this.categoryNameHi;
    data['CategoryImage'] = this.categoryImage;
    data['is_active'] = this.isActive;
    return data;
  }
}
