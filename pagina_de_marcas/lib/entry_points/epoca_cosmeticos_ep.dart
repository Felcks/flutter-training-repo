import 'package:flutter/material.dart';
import 'package:pagina_de_marcas/config/app_config.dart';
import 'package:pagina_de_marcas/config/color_config.dart';
import 'package:pagina_de_marcas/config/flag_config.dart';
import 'package:pagina_de_marcas/store/epoca_cosmeticos/brand_spotlight_elements.dart';
import 'package:pagina_de_marcas/store/off_premium/brand_spotlight_elements.dart';
import 'package:pagina_de_marcas/ui/screens/screen_master.dart';

import '../main_brand_page.dart';

void main() {

  ColorConfig.setBasicColors(
    primaryColor: Color(0xffC21581),
    darkPrimaryColor:  Color(0xffa21581),
    lightPrimaryColor:  Color(0xffffffff),
    accentColor: Color(0xffC21581),
    primaryText:  Color(0xffC21581),
    secondaryText:  Color(0xffC21581),
  );

  NonFilledButtonColor.setColors(
      highlightColor: Color(0x35C21581),
      splashColor: Color(0x35C21581)
  );

  FlagConfig.cardFlag = CardFlag();

  ScreenMaster.brandSpotlightElements = EpocaBrandSpotlightElementsImpl();

  var configuredApp = new AppConfig(
      appName: 'Época Cosmeticos',
      flavorName: 'EpocaCosmeticos',
      apiBaseUrl: 'api-homolog-epocacosmeticosv2.mobfiq.com.br',
      themeData: ThemeData(
        brightness: Brightness.light,
        primaryColor: ColorConfig.primaryColor,
        primaryColorLight: ColorConfig.lightPrimaryColor,
        primaryColorDark: ColorConfig.darkPrimaryColor,
        accentColor: ColorConfig.accentColor,
        backgroundColor: ColorConfig.lightPrimaryColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: ColorConfig.lightPrimaryColor,
          backgroundColor: ColorConfig.accentColor
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: ColorConfig.lightPrimaryColor,
          textTheme: TextTheme(
            title: TextStyle(
                color: ColorConfig.accentColor,
                fontSize: 20
            ),
            body1: TextStyle(
              color: ColorConfig.accentColor,
            ),
            button: TextStyle(
              color: ColorConfig.accentColor,
            ),
          ),
          iconTheme: IconThemeData(
            color: ColorConfig.accentColor,
          ),
        ),
        buttonTheme: ButtonThemeData(
            buttonColor: ColorConfig.accentColor,
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
                side: BorderSide(
                  color: ColorConfig.accentColor,
                )
            )
        ),
        iconTheme: IconThemeData(
          color: ColorConfig.accentColor,
        ),
      ),
      child: BrandPageApp()
  );

  runApp(configuredApp);
}