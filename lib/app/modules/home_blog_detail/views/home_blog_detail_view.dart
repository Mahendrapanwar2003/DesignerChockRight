import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:the_designer_chowk/app/apis/constant/constant_uris.dart';
import 'package:the_designer_chowk/app/data/views/comment_card.dart';
import '../controllers/home_blog_detail_controller.dart';

class HomeBlogDetailView extends GetView<HomeBlogDetailController> {
  const HomeBlogDetailView({Key? key}) : super(key: key);

  ImageProvider showProfilePic() {
    if (controller.blog.blogImage?.isNotEmpty ?? false) {
      return NetworkImage(ConstantUris.baseUrl + controller.blog.blogImage!);
    }
    return const AssetImage('assets/images/image_blog.png');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color? color = Colors.grey;
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0.4,
          title: Text('Business'.tr,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  ?.copyWith(fontSize: 19)),
          actions: const [
            Icon(Icons.add),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Bounceable(
                        onTap: () {},
                        child: Image(
                          image: showProfilePic(),
                        ),
                      ),
                      Container(
                        height: 28,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, bottom: 30),
                          child: Text(
                            controller.blogDetail.value?.createTime
                                    .toString() ??
                                '',
                            style: Theme.of(context).textTheme.button?.copyWith(
                                fontSize: 10,
                                color: Theme.of(context).colorScheme.outline),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 15, bottom: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              controller.count.value.toString() == "0"
                                  ? ''
                                  : '',
                            ),
                            SizedBox(
                              height: 35,
                              width: 35,
                              child: FloatingActionButton(
                                elevation: 0,
                                heroTag: null,
                                backgroundColor: (controller.isLikes.value ==
                                            '0' ||
                                        controller.blogDetail.value?.isLikes ==
                                            '0')
                                    ? Colors.white
                                    : Colors.blue,
                                onPressed: () => controller.likeButton(),
                                child: Icon(
                                    size: 14,
                                    Icons.thumb_up_alt_rounded,
                                    color: (controller.isLikes.value == '0' ||
                                            controller.blogDetail.value
                                                    ?.isLikes ==
                                                '0')
                                        ? Colors.grey
                                        : Colors.white),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              height: 35,
                              width: 35,
                              child: FloatingActionButton(
                                elevation: 0,
                                heroTag: null,
                                backgroundColor: Colors.white,
                                onPressed: () {},
                                child:  Icon(
                                  size: 14,
                                  Icons.share,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: Theme.of(context).textTheme.button?.color,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.blogDetail.value?.blogTitle.toString() ??
                                '',
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(fontSize: 16),
                          ),
                          const SizedBox(height: 11),
                          Text(
                            controller.blogDetail.value?.blogDescription
                                    .toString() ??
                                '',
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(
                                    fontSize: 13, fontFamily: 'GilroyMedium'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 11),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                    child: Text(
                      'All Comments'.tr,
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          ?.copyWith(fontSize: 16),
                    ),
                  ),
                  CommentCard(list: controller.comments),
                ],
              ),
            ),
            Container(
              width: size.height * 3,
              color: Theme.of(context).colorScheme.onPrimary,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: TextFormField(
                          controller: controller.sms,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(
                                  fontSize: 16, fontFamily: 'GilroyMedium'),
                          decoration: InputDecoration(
                            prefixIcon:
                                const Icon(Icons.emoji_emotions_outlined),
                            hintText: 'Write your message...'.tr,
                            hintStyle: Theme.of(context).textTheme.caption,
                            contentPadding:
                                const EdgeInsets.only(top: 12, right: 4),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Theme.of(context).colorScheme.primary),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.outline)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                      width: 45,
                      child: FloatingActionButton(
                        elevation: 0,
                        heroTag: null,
                        backgroundColor:
                            Theme.of(context).textTheme.caption?.color,
                        onPressed: () => controller.sendSmsButton(),
                        child: Icon(
                            size: 24,
                            Icons.send,
                            color: Theme.of(context).textTheme.button?.color),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
