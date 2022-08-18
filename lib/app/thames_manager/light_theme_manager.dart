import 'package:flutter/material.dart';
import 'package:the_designer_chowk/app/colors_manager/colors_manager.dart';
import 'package:the_designer_chowk/app/thames_manager/thames_manager.dart';

class LightThemesManager extends ThamesManager {
  @override
  AppBarTheme get appBarTheme => AppBarTheme(
        elevation: 0,
        backgroundColor: LightColorsManager().appBarColor,
    iconTheme: IconThemeData(color: LightColorsManager().primary),
      );

  @override
  TextStyle get hadingText => TextStyle(
        fontFamily: "GilroyBold",
        fontSize: 32,
        letterSpacing: 1,
        color: LightColorsManager().hading,
      );

  @override
  TextStyle get titleText => TextStyle(
        fontFamily: "GilroySemiBold",
        fontSize: 18,
        color: LightColorsManager().title,
      );

  @override
  TextStyle get subtitleOtp => TextStyle(
        fontFamily: "GilroySemiBold",
        fontSize: 25,
        color: LightColorsManager().subTitleText2,
      );

  @override
  TextStyle get bodyTitleText => TextStyle(
        fontFamily: "Gilroy",
        fontSize: 18,
        color: LightColorsManager().bodyTextTitle,
      );

  @override
  TextStyle get subtitleNumber => TextStyle(
        fontFamily: "GilroySemiBold",
        fontSize: 18,
        color: LightColorsManager().subTitleText,
      );

  @override
  TextStyle get button => TextStyle(
        fontFamily: "GilroySemiBold",
        fontSize: 14,
        color: LightColorsManager().elevatedButtonTextColor,
      );

  @override
  TextStyle get captionText => TextStyle(
        fontFamily: "GilroyMedium",
        fontSize: 16,
        color: LightColorsManager().caption,
      );

  @override
  TextStyle get textNormal => TextStyle(
        fontFamily: "GilroySemiBold",
        fontWeight: FontWeight.w300,
        fontSize: 18,
        color: LightColorsManager().textColorTheme,
      );

  @override
  ElevatedButtonThemeData get elevatedButtonThemeData =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(190, 50),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            primary: LightColorsManager().primary),
      );

  @override
  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        border: UnderlineInputBorder(
          borderSide: BorderSide(
              color: LightColorsManager().secondaryLightColor, width: 1),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: LightColorsManager().caption, width: 1),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(color: LightColorsManager().secondary, width: 1),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: LightColorsManager().secondaryDarkColor, width: 1),
        ),
      );

  @override
  TextButtonThemeData get textButtonThemeData => TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: LightColorsManager().secondary,
        ),
      );

  @override
  OutlinedButtonThemeData get outlinedButtonThemeData =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(double.infinity, 80),
          textStyle:
              TextStyle(color: LightColorsManager().outLineButtonTextColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );

  @override
  BottomSheetThemeData get bottomSheetThemeData => BottomSheetThemeData(
        backgroundColor: LightColorsManager().bottomSheetColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
      );
}
