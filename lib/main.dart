import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:the_designer_chowk/app/colors_manager/colors_manager.dart';
import 'package:the_designer_chowk/app/data/language_change.dart';
import 'package:the_designer_chowk/app/routes/app_pages.dart';
import 'package:the_designer_chowk/app/thames_manager/dark_theme_manager.dart';
import 'package:the_designer_chowk/app/thames_manager/light_theme_manager.dart';
import 'package:the_designer_chowk/app/utils/language_singleton.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DataSingleton.instance.onInit();
  runApp(
    GetMaterialApp(
      title: "Application",
      translations: TranslationLanguage(),
      locale: const Locale("en", "US"),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        fontFamily: "Gilroy",
        colorScheme: ColorScheme.light(
          primary: LightColorsManager().secondary,
          secondary: LightColorsManager().secondary,
          error: Colors.red,
          outline: Colors.grey.shade200,
          background: Colors.white,
          onBackground: LightColorsManager().primary,
          onPrimary: LightColorsManager().screenColor,
        ),
        scaffoldBackgroundColor: LightColorsManager().screenColor,
        appBarTheme: LightThemesManager().appBarTheme,
        textSelectionTheme: TextSelectionThemeData(
            cursorColor: LightColorsManager().secondaryLightColor),
        inputDecorationTheme: LightThemesManager().inputDecorationTheme,
        elevatedButtonTheme: LightThemesManager().elevatedButtonThemeData,
        textButtonTheme: LightThemesManager().textButtonThemeData,
        outlinedButtonTheme: LightThemesManager().outlinedButtonThemeData,
        bottomSheetTheme: LightThemesManager().bottomSheetThemeData,
        textTheme: TextTheme(
          headline1: LightThemesManager().hadingText,
          bodyText1: LightThemesManager().bodyTitleText,
          bodyText2: LightThemesManager().titleText,
          caption: LightThemesManager().captionText,
          button: LightThemesManager().button,
          subtitle1: LightThemesManager().subtitleNumber,
          subtitle2: LightThemesManager().subtitleOtp,
          headline2: LightThemesManager().textNormal,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.dark(
          primary: DarkColorsManager().secondary,
          secondary: DarkColorsManager().secondary,
          error: Colors.red,
          outline: Colors.grey.shade100,
            background: Colors.black,
          onBackground: DarkColorsManager().primary,
        ),
        scaffoldBackgroundColor: DarkColorsManager().screenColor,
        appBarTheme: DarkThamesManager().appBarTheme,
        textSelectionTheme: TextSelectionThemeData(
            cursorColor: DarkColorsManager().secondaryLightColor),
        elevatedButtonTheme: DarkThamesManager().elevatedButtonThemeData,
        inputDecorationTheme: DarkThamesManager().inputDecorationTheme,
        textButtonTheme: DarkThamesManager().textButtonThemeData,
        outlinedButtonTheme: DarkThamesManager().outlinedButtonThemeData,
        bottomSheetTheme: DarkThamesManager().bottomSheetThemeData,
        textTheme: TextTheme(
          headline1: DarkThamesManager().hadingText,
          bodyText1: DarkThamesManager().bodyTitleText,
          bodyText2: DarkThamesManager().titleText,
          caption: DarkThamesManager().captionText,
          button: DarkThamesManager().button,
          subtitle1: DarkThamesManager().subtitleNumber,
          subtitle2: DarkThamesManager().subtitleOtp,
          headline2: DarkThamesManager().textNormal,
        ),
      ),
    ),
  );
}
