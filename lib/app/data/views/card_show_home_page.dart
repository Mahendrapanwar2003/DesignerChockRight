import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:the_designer_chowk/app/apis/constant/constant_uris.dart';
import 'package:the_designer_chowk/app/apis/models/get_blog_detail_model.dart';
import 'package:the_designer_chowk/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;

class CardShowHomePage extends StatelessWidget {
  List<Blog> list = [];
  String? token;
  CardShowHomePage({Key? key, required this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) {
          Blog obj = list.reversed.toList()[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4),
            child: Material(
              type: MaterialType.card,
              elevation: 1,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.HOME_BLOG_DETAIL, arguments: obj);
                    },
                    splashColor: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.2),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Container(
                                  height: 71,
                                  width: 71,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                      image: NetworkImage(ConstantUris.baseUrl +
                                          obj.blogImage.toString()),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      obj.blogTitle.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2
                                          ?.copyWith(fontSize: 16),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      obj.blogDescription.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2
                                          ?.copyWith(
                                              fontSize: 12,
                                              fontFamily: 'GilroyMedium'),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                obj.blogId.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    ?.copyWith(
                                      fontSize: 10,
                                      color: Theme.of(context)
                                          .textTheme
                                          .caption
                                          ?.color
                                          ?.withOpacity(0.4),
                                    ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  getCategoryId(obj.categoryId),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline2
                                      ?.copyWith(
                                          fontSize: 12,
                                          fontFamily: 'GilroySemiBold',
                                          color: Colors.green),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Divider(
                      color: Theme.of(context).colorScheme.outline,
                      height: 0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: LikeButton(
                          size: 15,
                          circleColor: const CircleColor(
                              start: Colors.blue, end: Colors.blue),
                          bubblesColor: const BubblesColor(
                            dotPrimaryColor: Colors.blue,
                            dotSecondaryColor: Colors.blue,
                          ),
                          likeBuilder: (bool isLiked) {
                            return Icon(
                              Icons.thumb_up_alt_rounded,
                              color: isLiked ? Colors.blue : Colors.grey,
                              size: 15,
                            );
                          },
                          likeCount: 0,
                          countBuilder:
                              (int? count, bool isLiked, String text) {
                            var color = isLiked ? Colors.blue : Colors.grey;
                            Widget result;
                            if (count != 0) {
                              result = Text(
                                'Like'.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    ?.copyWith(
                                      fontSize: 13,
                                      color: color,
                                    ),
                              );
                            } else {
                              result = Text(
                                'Like'.tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    ?.copyWith(
                                      fontSize: 13,
                                      color: color,
                                    ),
                              );
                            }
                            return result;
                          },
                        ),
                      ),
                      localTextButton(
                          context: context,
                          icon: Icons.comment_rounded,
                          text: 'Comment'.tr,
                          onTap: () {}),
                      localTextButton(
                        context: context,
                        icon: Icons.share,
                        text: 'Share'.tr,
                        onTap: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget localTextButton({
    required BuildContext context,
    required IconData icon,
    required String text,
    VoidCallback? onTap,
  }) =>
      Expanded(
        child: TextButton(
          onPressed: onTap,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 18,
                color: Colors.grey,
              ),
              const SizedBox(width: 2),
              Text(
                text,
                style: Theme.of(context).textTheme.button?.copyWith(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
              ),
            ],
          ),
        ),
      );
  String getCategoryId(String? categoryId) {
    if (categoryId == '1') {
      return 'Latest';
    } else if (categoryId == '2') {
      return 'Sports';
    } else if (categoryId == '3') {
      return 'Movies';
    } else if (categoryId == '4') {
      return 'Science';
    } else if (categoryId == '5') {
      return 'Politics';
    }
    return "Bussiness";
  }
}
