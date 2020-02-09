import 'package:flutter/material.dart';
import 'package:pagina_de_marcas/config/color_config.dart';

class Buttons{

  static RaisedButton filled({Null Function() onPressed, Text child, EdgeInsets padding}){
    return RaisedButton(
      onPressed: onPressed,
      child: child,
      padding: padding,
    );
  }
  static ButtonThemeData nonFilled(){

    return ButtonThemeData(
      buttonColor: Colors.white,
      highlightColor: NonFilledButtonColor.highlightColor,
      splashColor:  NonFilledButtonColor.splashColor,
      textTheme: ButtonTextTheme.accent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
          side: BorderSide(color: ColorConfig.accentColor)
      )
    );
//    return RaisedButton(
//      onPressed: onPressed,
//      child: child,
//      padding: padding,
//      color: Colors.white,
//      highlightColor:  Theme.of(context).accentColor,
//      splashColor:  Theme.of(context).accentColor,
//      shape: RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(32),
//          side: BorderSide(color: Theme.of(context).primaryColor)
//      )
//    );
  }

}