import 'dart:ui';

import 'package:flutter/cupertino.dart';

class ColorConfig{

  Color primaryColor;
  Color darkPrimaryColor;
  Color lightPrimaryColor;
  Color accentColor;
  Color primaryText;
  Color secondaryText;

  ColorConfig({
    @required this.primaryColor,
    @required this.darkPrimaryColor,
    @required this.lightPrimaryColor,
    @required this.accentColor,
    @required this.primaryText,
    @required this.secondaryText,
  });
  
}