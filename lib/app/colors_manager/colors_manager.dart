import 'package:flutter/widgets.dart';

abstract class ColorsManager
{
  Color get primary;
  Color get primaryLightColor;
  Color get primaryDarkColor;

  Color get secondary;
  Color get secondaryLightColor;
  Color get secondaryDarkColor;

  Color get hading;
  Color get title;
  Color get bodyTitle;
  Color get caption;

  Color get green;
  Color get likeBlue;

  Color get screenColor;
  
  Color get appBarColor;


  Color get iconColor;

  Color get elevatedButtonTextColor;

  Color get outLineButtonTextColor;

  Color get bottomSheetColor;
  Color get bodyTextTitle;
  Color get subTitleText;
  Color get subTitleText2;
  Color get textColorTheme;
}


class LightColorsManager extends ColorsManager
{
  @override
  Color get primary => const Color(0xff0F0D0E);

  @override
  Color get primaryDarkColor => const Color(0xff000000);

  @override
  Color get primaryLightColor => const Color(0x900f0d0e);

  @override
  Color get secondary => const Color(0xffFB0067);

  @override
  Color get secondaryDarkColor => const Color(0xfffb004b);

  @override
  Color get secondaryLightColor => const Color(0xd3fb0067);

  @override
  Color get bodyTitle => const Color(0xff121614);

  @override
  Color get caption => const Color(0xff6F7C8E);

  @override
  Color get green => const Color(0xff00920F);

  @override
  Color get hading => const Color(0xff121614);

  @override
  Color get likeBlue => const Color(0xff1E96FF);

  @override
  Color get screenColor => const Color(0xffF6F7FB);

  @override
  Color get title => const Color(0xff121614);

  @override
  Color get bodyTextTitle => const Color(0xff6F7C8E);

  @override
  Color get appBarColor => const Color(0xffFFFFFF);

  @override
  Color get iconColor => const Color(0xffb6b2b2);

  @override
  Color get elevatedButtonTextColor => const Color(0xffffffff);

  @override
  Color get outLineButtonTextColor => const Color(0xff050505);

  @override
  Color get bottomSheetColor => const Color(0xffffffff);

  @override
  Color get subTitleText => const Color(0xff0F0D0E);

  @override
  Color get subTitleText2 => const Color(0xff0F0D0E);

  @override
  Color get textColorTheme => const Color(0xff121614);

}


class DarkColorsManager extends ColorsManager
{
  @override
  Color get primary => const Color(0xffffffff);

  @override
  Color get primaryDarkColor => const Color(0xff5d5d5d);

  @override
  Color get primaryLightColor => const Color(0xffb7b7b7);

  @override
  Color get secondary => const Color(0xffFB0067);

  @override
  Color get secondaryDarkColor => const Color(0xfffb004b);

  @override
  Color get secondaryLightColor => const Color(0xd3fb0067);

  @override
  Color get bodyTitle => const Color(0xffbac5c0);

  @override
  Color get caption => const Color(0xff6F7C8E);

  @override
  Color get green => const Color(0xff00920F);

  @override
  Color get hading => const Color(0xffffffff);

  @override
  Color get likeBlue => const Color(0xff1E96FF);

  @override
  Color get screenColor => const Color(0xff181818);

  @override
  Color get title => const Color(0xffeee9eb);

  @override
  Color get appBarColor => const Color(0xff070707);

  @override
  Color get iconColor => const Color(0xff070607);

  @override
  Color get elevatedButtonTextColor => const Color(0xff000000);

  @override
  Color get outLineButtonTextColor => const Color(0xffffffff);

  @override
  Color get bottomSheetColor => const Color(0xff171717);

  @override
  Color get bodyTextTitle => const Color(0xff8d9eb4);

  @override
  Color get subTitleText => const Color(0xfff8e5ef);

  @override
  Color get subTitleText2 => const Color(0xffd7d5d6);

  @override
  Color get textColorTheme => const Color(0xffb7b9b8);
}