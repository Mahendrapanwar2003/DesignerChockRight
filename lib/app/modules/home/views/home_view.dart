import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_designer_chowk/app/apis/constant/constant_uris.dart';
import 'package:the_designer_chowk/app/data/views/card_show_home_page.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  ImageProvider showProfilePic() {
    if (controller.userProfile.isNotEmpty) {
      return NetworkImage(ConstantUris.baseUrl + controller.userProfile.value);
    }
    return const AssetImage("assets/images/image.png");
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => controller.homeTab != 0
          ? DefaultTabController(
              length: controller.homeTab.length,
              child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: 62,
                  elevation: 0.4,
                  bottom: TabBar(
                    isScrollable: true,
                    labelColor: const Color(0xffFB0067),
                    unselectedLabelColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Theme.of(context).colorScheme.secondary,
                    indicator: _TabIndicator(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    tabs: List<Widget>.generate(controller.homeTab.length,
                        (int index) {
                      print(controller.homeTab[index]);
                      return Tab(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Center(
                              child: Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(ConstantUris.baseUrl +
                                        controller
                                            .homeTab[index].categoryImage!),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(controller.homeTab[index].categoryName!),
                          ],
                        ),
                      );
                    }),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Row(
                        children: [
                          Text(controller.homeTab.isNotEmpty
                              ? ''
                              : ''),
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              IconButton(
                                splashRadius: 24,
                                onPressed: () =>
                                    controller.clickOnNotification(),
                                icon: const Icon(
                                    Icons.notifications_none_rounded),
                              ),
                              controller.notificationCountValue.value != 0
                                  ? Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        height: 14,
                                        width: 14,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            controller.notificationCountValue.value.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2
                                                ?.copyWith(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontSize: 10,
                                                    color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(Icons.location_on_outlined),
                            splashRadius: 24,
                            onPressed: () => controller.clickOnLocationButton(),
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
                                color: Theme.of(context).colorScheme.outline)),
                      ),
                    ),
                  ),
                  leading: GestureDetector(
                    onTap: () => controller.clickProfile(),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Container(
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
                  children: List<Widget>.generate(controller.homeTab.length,
                      (int index) {
                    print(controller.homeTab[0]);
                    return const CardShowHomePage();
                  }),
                ),
              ),
            )
          : Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: const [
                        CircularProgressIndicator(color: Colors.deepOrange),
                      ],
                    ),
                    Text(controller.count == 0 ? '' : '')
                  ],
                ),
              ),
            ),
    );
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
