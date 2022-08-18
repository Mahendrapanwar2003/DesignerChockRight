import 'package:flutter/material.dart';
import 'package:the_designer_chowk/app/colors_manager/colors_manager.dart';
import 'package:the_designer_chowk/app/thames_manager/thames_manager.dart';

class DarkThamesManager extends ThamesManager {
  @override
  AppBarTheme get appBarTheme => AppBarTheme(
    elevation: 0,
    backgroundColor: DarkColorsManager().appBarColor,
    iconTheme: IconThemeData(color: DarkColorsManager().primary),
  );

  @override
  TextStyle get hadingText => TextStyle(
    fontFamily: "GilroyBold",
    fontSize: 32,
    letterSpacing: 1,
    color: DarkColorsManager().hading,
  );

  @override
  TextStyle get titleText => TextStyle(
    fontFamily: "GilroySemiBold",
    fontSize: 18,
    color: DarkColorsManager().title,
  );

  @override
  TextStyle get subtitleOtp => TextStyle(
    fontFamily: "Gilroy",
    fontSize: 25,
    color: DarkColorsManager().subTitleText2,
  );

  @override
  TextStyle get bodyTitleText => TextStyle(
    fontFamily: "Gilroy",
    fontSize: 18,
    color: DarkColorsManager().bodyTextTitle,
  );

  @override
  TextStyle get subtitleNumber => TextStyle(
    fontFamily: "GilroySemiBold",
    fontSize: 18,
    color: DarkColorsManager().subTitleText,
  );

  @override
  TextStyle get button => TextStyle(
    fontFamily: "GilroySemiBold",
    fontSize: 14,
    color: DarkColorsManager().elevatedButtonTextColor,
  );

  @override
  TextStyle get captionText => TextStyle(
    fontFamily: "GilroyMedium",
    fontSize: 16,
    color: DarkColorsManager().caption,
  );

  @override
  TextStyle get textNormal => TextStyle(
    fontFamily: "GilroySemiBold",
    fontWeight: FontWeight.w300,
    fontSize: 18,
    color: DarkColorsManager().textColorTheme,
  );

  @override
  ElevatedButtonThemeData get elevatedButtonThemeData =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(190, 50),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            primary: DarkColorsManager().primary),
      );

  @override
  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
    border: UnderlineInputBorder(
      borderSide: BorderSide(
          color: DarkColorsManager().secondaryLightColor, width: 1),
    ),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: DarkColorsManager().caption, width: 1),
    ),
    errorBorder: UnderlineInputBorder(
      borderSide:
      BorderSide(color: DarkColorsManager().secondary, width: 1),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
          color: DarkColorsManager().secondaryDarkColor, width: 1),
    ),
  );

  @override
  TextButtonThemeData get textButtonThemeData => TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: DarkColorsManager().secondary,
    ),
  );

  @override
  OutlinedButtonThemeData get outlinedButtonThemeData =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(double.infinity, 80),
          textStyle:
          TextStyle(color: DarkColorsManager().outLineButtonTextColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );

  @override
  BottomSheetThemeData get bottomSheetThemeData => BottomSheetThemeData(
    backgroundColor: DarkColorsManager().bottomSheetColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      ),
    ),
  );
}
