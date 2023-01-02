import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:the_designer_chowk/app/routes/app_pages.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        title: Text('Notification'.tr,
            style:
                Theme.of(context).textTheme.headline2?.copyWith(fontSize: 19)),
      ),
      body: ListView.builder(
        itemCount: controller.notificationData.length,
        itemBuilder: ((context, index) => ListTile(
          onTap: () {},
          tileColor: Theme.of(context).colorScheme.background,
          iconColor: Theme.of(context).colorScheme.onBackground,
          trailing: Text(
            controller.notificationData[index]['create_time'],
            style: Theme.of(context).textTheme.button?.copyWith(
              fontSize: 12,
              color: Theme.of(context)
                  .textTheme
                  .caption
                  ?.color
                  ?.withOpacity(0.4),
            ),
            overflow: TextOverflow.ellipsis,
          ),
          title: Text(
            controller.notificationData[index]['notification_title'],
            style: Theme.of(context).textTheme.button?.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
          controller.notificationData[index]['notification_message'],
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(fontSize: 10),
                  overflow: TextOverflow.ellipsis),
              Text( controller.notificationData[index]['notification_image'],
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(fontSize: 10),
                  overflow: TextOverflow.ellipsis),
            ],
          ),
          leading: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary,
                border: Border.all(
                    width: 1,
                    color: Theme.of(context).colorScheme.secondary)),
            child: Image.asset(
              'assets/images/image.png',
            ),
          ),
        ))
      ),
    );
  }
}
