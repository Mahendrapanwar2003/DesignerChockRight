import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:the_designer_chowk/app/apis/constant/constant_uris.dart';
import 'package:the_designer_chowk/app/apis/models/get_blog_detail_model.dart';

// ignore: must_be_immutable
class CommentCard extends StatelessWidget {
  List<Comments> list = [];

  CommentCard({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: list.length,
          itemBuilder: ((context, index) {
            Comments comments = list.reversed.toList()[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Container(
                color: Theme.of(context).colorScheme.background,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {},
                        tileColor: Theme.of(context).colorScheme.background,
                        iconColor: Theme.of(context).colorScheme.onBackground,
                        trailing: SizedBox(
                          height: 27,
                          width: 27,
                          child: FloatingActionButton(
                              heroTag:null,
                              elevation: 0.5,
                              onPressed: () {},
                              backgroundColor: const Color(0xffC7D5E1),
                              child: const Icon(
                                Icons.flag_outlined,
                                size: 18,
                              )),
                        ),
                        title: Text(
                          comments.fullName!,
                          style: Theme.of(context).textTheme.button?.copyWith(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          comments.createTime!,
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
                        leading: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: (comments.userProfile!.isEmpty
                                      ? const AssetImage(
                                          'assets/images/image.png')
                                      : NetworkImage(ConstantUris.baseUrl +
                                              comments.userProfile!)
                                          as ImageProvider),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              comments.comment!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(
                                      fontSize: 13, fontFamily: 'GilroyMedium'),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Divider(
                          color: Theme.of(context).colorScheme.outline,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: Row(
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
                                  var color =
                                      isLiked ? Colors.blue : Colors.grey;
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
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 14.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          height: 18,
                                          width: 18,
                                          child: FloatingActionButton(
                                            elevation: 0,
                                            heroTag: null,
                                            backgroundColor: Colors.blue,
                                            onPressed: () {},
                                            child: Icon(
                                                size: 10,
                                                Icons.thumb_up_alt_rounded,
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .button
                                                    ?.color),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          comments.likeCount!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .button
                                              ?.copyWith(
                                                fontSize: 14,
                                                color: Colors.grey,
                                              ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
