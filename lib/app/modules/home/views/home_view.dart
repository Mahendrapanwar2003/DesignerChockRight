import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_designer_chowk/app/apis/constant/constant_uris.dart';
import 'package:the_designer_chowk/app/data/sheets/selected_locating.dart';
import 'package:the_designer_chowk/app/data/views/card_show_home_page.dart';
import 'package:the_designer_chowk/app/routes/app_pages.dart';
import 'package:the_designer_chowk/app/utils/language_singleton.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  ImageProvider showProfilePic() {
    if (controller.user_profile.isNotEmpty) {
      return NetworkImage(ConstantUris.baseUrl + controller.user_profile.value);
    }
    return const AssetImage("assets/images/image.png");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(() => controller.count>0?Scaffold(
          appBar: AppBar(
            toolbarHeight: 62,
            elevation: 0.4,
            bottom: TabBar(
              controller: controller.controller,
              tabs: controller.myTabs,
              labelColor: const Color(0xffFB0067),
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label,
              //indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Theme.of(context).colorScheme.secondary,
              isScrollable: true,
              indicator: _TabIndicator(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  children: [
                    Text(controller.count.value.toString() == 0 ? '' : ''),
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.NOTIFICATION);
                          },
                          icon: const Icon(Icons.notifications_none_rounded),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 14,
                            width: 14,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '2',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2
                                    ?.copyWith(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: 10,
                                        color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.location_on_outlined),
                      onPressed: () {
                        controller.savedInLocal();
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return SizedBox(
                              height: 300,
                              width: double.infinity,
                              child: SelectedLocation(
                                  selectedLocation:
                                      controller.selectedLocation.value,
                                  changeLocation: (String value) {
                                    controller.selectedLocation(value);
                                    DataSingleton.instance.locationId = value;
                                  },
                                  onPressed: () {},
                                ),
                              );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
            title: SizedBox(
              height: 38,
              width: size.height * 3,
              child: TextField(
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(fontSize: 16, fontFamily: 'GilroyMedium'),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search here...'.tr,
                  hintStyle: Theme.of(context).textTheme.caption,
                  contentPadding: const EdgeInsets.only(top: 12, right: 4),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(
                        width: 1, color: Theme.of(context).colorScheme.primary),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.outline)),
                ),
              ),
            ),
            leading: InkWell(
              onTap: () => controller.clickProfile(),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child:Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: showProfilePic(), fit: BoxFit.cover)),
                  ),
                ),
            ),
          ),
          body: TabBarView(
            physics: BouncingScrollPhysics(),
            controller: controller.controller,
            children: [
              CardShowHomePage(
                list: controller.list,
              ),
              CardShowHomePage(
                list: controller.list,
              ),
              CardShowHomePage(
                list: controller.list,
              ),
              CardShowHomePage(
                list: controller.list,
              ),
              CardShowHomePage(
                list: controller.list,
              ),
              CardShowHomePage(
                list: controller.list,
              ),
            ],
          ),
        ):Scaffold(body:Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [Column(
          children: [
            CircularProgressIndicator(color: Colors.deepOrange),
          ],
        ),Text(controller.count==0?'':'')],)) ));
  }
}

class _TabIndicator extends BoxDecoration {
  final BoxPainter _painter;

  _TabIndicator({required Color color})
      : _painter = _TabIndicatorPainter(color);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _TabIndicatorPainter extends BoxPainter {
  final Paint _paint;

  _TabIndicatorPainter(Color color)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final double _xPos = offset.dx + cfg.size!.width / 2;
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTRB(_xPos - 20, 0, _xPos + 20, 3),
        bottomLeft: const Radius.circular(5.0),
        bottomRight: const Radius.circular(5.0),
      ),
      _paint,
    );
  }
}
