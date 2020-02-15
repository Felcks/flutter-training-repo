import 'package:flutter/material.dart';
import 'package:pagina_de_marcas/config/color_config.dart';

class Buttons{

  static ButtonThemeData filled(){
    return ButtonThemeData();
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
  }

  static ButtonThemeData unavailable(){
    return ButtonThemeData(
        buttonColor: Colors.grey,
        highlightColor: Colors.white54,
        splashColor: Colors.white54,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
            side: BorderSide(color: Colors.grey)
        )
    );
  }

}