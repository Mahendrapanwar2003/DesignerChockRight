import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_designer_chowk/app/data/views/selected_card.dart';
import 'package:the_designer_chowk/app/routes/app_pages.dart';
import 'package:the_designer_chowk/app/utils/language_singleton.dart';

class SelectedLanguagePage extends StatelessWidget {
  const SelectedLanguagePage(
      {Key? key,
      required this.selectedLanguage,
      required this.changeLanguage,
      required this.onPressed})
      : super(key: key);

  final String selectedLanguage;
  final Function(String value) changeLanguage;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.height * 0.02),
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: size.height * 0.015),
              Text('Change Language'.tr,
                  style: Theme.of(context).textTheme.bodyText2),
              SizedBox(height: size.height * 0.01),
              SelectedCard(
                imagePath: 'assets/images/back_photo_english.png',
                textTitle: 'ENGLISH'.tr,
                selected: selectedLanguage == 'en',
                onPressed: () {
                  changeLanguage('en');
                },
                showImage: true,
              ),
              SelectedCard(
                imagePath: 'assets/images/back_photo_hindi.png',
                textTitle: 'HINDI'.tr,
                selected: selectedLanguage == 'hi',
                onPressed: () {
                  changeLanguage('hi');
                },
                showImage: true,
              ),
              SizedBox(height: size.height * 0.005),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 52)),
                onPressed: () {
                  if (selectedLanguage == "en") {
                    var local = Locale("en", "US");
                    Get.updateLocale(local);
                    DataSingleton.instance.languageId = 'en';
                  } else {
                    var local = Locale("hi", "IN");
                    Get.updateLocale(local);
                    DataSingleton.instance.languageId = 'hi';
                  }
                  Get.back();
                },
                child: Text('SAVE LANGUAGE'.tr,
                    style: Theme.of(context).textTheme.button),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
