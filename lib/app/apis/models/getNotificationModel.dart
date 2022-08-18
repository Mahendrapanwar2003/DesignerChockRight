class GetNotificationModel {
  String? message;
  List<NotificationData>? notificationData;

  GetNotificationModel({this.message, this.notificationData});

  GetNotificationModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['NotificationData'] != null) {
      notificationData = <NotificationData>[];
      json['NotificationData'].forEach((v) {
        notificationData!.add(new NotificationData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.notificationData != null) {
      data['NotificationData'] =
          this.notificationData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NotificationData {
  String? notificationId;
  String? userId;
  String? notificationTitle;
  String? notificationMessage;
  String? notificationImage;
  String? isRead;
  String? createdDate;
  String? createDate;
  String? createTime;

  NotificationData(
      {this.notificationId,
        this.userId,
        this.notificationTitle,
        this.notificationMessage,
        this.notificationImage,
        this.isRead,
        this.createdDate,
        this.createDate,
        this.createTime});

  NotificationData.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    userId = json['user_id'];
    notificationTitle = json['notification_title'];
    notificationMessage = json['notification_message'];
    notificationImage = json['notification_image'];
    isRead = json['is_read'];
    createdDate = json['created_date'];
    createDate = json['create_date'];
    createTime = json['create_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notification_id'] = this.notificationId;
    data['user_id'] = this.userId;
    data['notification_title'] = this.notificationTitle;
    data['notification_message'] = this.notificationMessage;
    data['notification_image'] = this.notificationImage;
    data['is_read'] = this.isRead;
    data['created_date'] = this.createdDate;
    data['create_date'] = this.createDate;
    data['create_time'] = this.createTime;
    return data;
  }
}
