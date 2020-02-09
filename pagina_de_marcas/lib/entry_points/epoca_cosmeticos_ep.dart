import 'package:flutter/material.dart';
import 'package:pagina_de_marcas/config/app_config.dart';
import 'package:pagina_de_marcas/config/color_config.dart';

import '../main.dart';

void main() {

  ColorConfig colorConfig = ColorConfig(
    primaryColor: Color(0xffC21581),
    darkPrimaryColor:  Color(0xffa21581),
    lightPrimaryColor:  Color(0xffffffff),
    accentColor: Color(0xffC21581),
    primaryText:  Color(0xffC21581),
    secondaryText:  Color(0xffC21581),
  );

  var configuredApp = new AppConfig(
      appName: 'Época Cosmeticos',
      flavorName: 'EpocaCosmeticos',
      apiBaseUrl: 'https://api.example.com/',
      themeData: ThemeData(
        brightness: Brightness.light,
        primaryColor: colorConfig.primaryColor,
        primaryColorLight: colorConfig.lightPrimaryColor,
        primaryColorDark: colorConfig.darkPrimaryColor,
        accentColor: colorConfig.accentColor,
        backgroundColor: colorConfig.lightPrimaryColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: colorConfig.lightPrimaryColor,
          backgroundColor: colorConfig.accentColor
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: colorConfig.lightPrimaryColor,
          textTheme: TextTheme(
            title: TextStyle(
                color: colorConfig.accentColor,
                fontSize: 20
            ),
            body1: TextStyle(
              color: colorConfig.accentColor,
            ),
            button: TextStyle(
              color: colorConfig.accentColor,
            ),
          ),
          iconTheme: IconThemeData(
            color: colorConfig.accentColor,
          ),
        ),
        buttonTheme: ButtonThemeData(
            buttonColor: colorConfig.accentColor,
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
                side: BorderSide(
                  color: colorConfig.accentColor,
                )
            )
        ),
        iconTheme: IconThemeData(
          color: colorConfig.accentColor,
        ),
      ),
      child: MyApp()
  );

  runApp(configuredApp);
}