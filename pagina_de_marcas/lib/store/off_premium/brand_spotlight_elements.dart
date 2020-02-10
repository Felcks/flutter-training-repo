import 'package:flutter/material.dart';
import 'package:pagina_de_marcas/config/color_config.dart';
import 'package:pagina_de_marcas/ui/screens/brand/spotlight/brand_spotlight_elements.dart';

class OffPremiumBrandSpotlightElementsImpl implements BrandSpotlightElements {

  ButtonThemeData getButton01(){
    return ButtonThemeData(
        buttonColor: Colors.white,
        highlightColor: ColorConfig.primaryColor.withAlpha(35),
        splashColor:  ColorConfig.primaryColor.withAlpha(35),
        textTheme: ButtonTextTheme.normal,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
            side: BorderSide(color: ColorConfig.primaryColor)
        )
    );
  }
}