import 'package:flutter/material.dart';

class ColorConfig{

  static Color primaryColor;
  static Color darkPrimaryColor;
  static Color lightPrimaryColor;
  static Color accentColor;
  static Color primaryText;
  static Color secondaryText;

  Color highlightNonFilledButtonColor;
  Color splashColor;

  static void setBasicColors({
    @required Color primaryColor,
    @required Color darkPrimaryColor,
    @required Color lightPrimaryColor,
    @required Color accentColor,
    @required Color primaryText,
    @required Color secondaryText
  }){
    ColorConfig.primaryColor = primaryColor;
    ColorConfig.darkPrimaryColor = darkPrimaryColor;
    ColorConfig.lightPrimaryColor = lightPrimaryColor;
    ColorConfig.accentColor = accentColor;
    ColorConfig.primaryText = primaryText;
    ColorConfig.secondaryText = secondaryText;
  }
}