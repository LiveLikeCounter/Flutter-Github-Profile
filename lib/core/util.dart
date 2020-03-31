import 'package:flutter/material.dart';

class CustomThemes 
{
  // static const WhiteTheme = Theme.of(context).copyWith(canvasColor: Colors.white);
}

class CustomColors 
{
  static const Color BodyBackground = Color.fromRGBO(249, 252, 255, 1);
  
  static const Color White75 = Color.fromRGBO(255, 255, 255, 0.75);

  static const Color YellowLight = Color.fromRGBO(254, 247, 203, 1);
  static const Color Yellow = Color.fromRGBO(254, 235, 112, 1);
  static const Color YellowDark = Color.fromRGBO(255, 190, 0, 1);

  static const Color VioletExtraLight = Color.fromRGBO(235, 237, 252, 1);
  static const Color VioletLight = Color.fromRGBO(228, 231, 251, 1);
  static const Color Violet = Color.fromRGBO(194, 203, 255, 1);

  static const Color Pink = Color.fromRGBO(255, 117, 227, 1);

  static const Color BlueIntense = Color.fromRGBO(58, 217, 242, 1);
  static const Color Blue = Color.fromRGBO(7, 156, 255, 1);
  static const Color BlueDark = Color.fromRGBO(51, 82, 125, 1);
  static const Color BlueDark75 = Color.fromRGBO(51, 82, 125, 0.75);
}

class CustomTextStyles 
{
  static const TextStyle ProfileLargeText = TextStyle(fontSize: 32, color: CustomColors.Blue);
  static const TextStyle ProfileNormalText = TextStyle(fontSize: 16, color: CustomColors.Blue);

  static const TextStyle ProfileMetricsTitle = TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: CustomColors.Pink);
  static const TextStyle ProfileMetricsSubTitle = TextStyle(fontSize: 16, color: CustomColors.Pink);
  
  static const TextStyle GithubCardTitle = TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: CustomColors.BlueDark);
  static const TextStyle GithubCardSubTitle = TextStyle(fontSize: 16, color: CustomColors.BlueDark75);
  static const TextStyle GithubCardMetricNumber = TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: CustomColors.BlueDark);
  static const TextStyle GithubCardMetricDescription = TextStyle(fontSize: 16, color: CustomColors.BlueDark);
}


