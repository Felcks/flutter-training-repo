import 'package:flutter/material.dart';
import 'package:bolao/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/utils/app_config.dart';
import 'app/utils/color_config.dart';

void main() {
  ColorConfig.setBasicColors(
    primaryColor: Color(0xff000000),
    darkPrimaryColor: Color(0xff000000),
    lightPrimaryColor: Color(0xffffffff),
    accentColor: Color(0xffD32F2F),
    primaryText: Color(0xff000000),
    secondaryText: Color(0xff000000),
  );

  var configuredApp = new AppConfig(
      appName: 'Bolão da capivara',
      flavorName: 'BolaoCapivara',
      apiBaseUrl: 'api-epocacosmeticosv2.mobfiq.com.br',
      themeData: ThemeData(
        brightness: Brightness.light,
        primaryColor: ColorConfig.primaryColor,
        primaryColorLight: ColorConfig.lightPrimaryColor,
        primaryColorDark: ColorConfig.darkPrimaryColor,
        accentColor: ColorConfig.accentColor,
        backgroundColor: ColorConfig.lightPrimaryColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            foregroundColor: ColorConfig.lightPrimaryColor,
            backgroundColor: ColorConfig.accentColor),
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: ColorConfig.darkPrimaryColor,
          textTheme: TextTheme(
            title:
                TextStyle(color: ColorConfig.lightPrimaryColor, fontSize: 20),
            body1: TextStyle(
              color: ColorConfig.lightPrimaryColor,
            ),
            button: TextStyle(
              color: ColorConfig.lightPrimaryColor,
            ),
          ),
          iconTheme: IconThemeData(
            color: ColorConfig.lightPrimaryColor,
          ),
        ),
        buttonTheme: ButtonThemeData(
            buttonColor: ColorConfig.accentColor,
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
                side: BorderSide(
              color: ColorConfig.accentColor,
            ))),
        iconTheme: IconThemeData(
          color: ColorConfig.lightPrimaryColor,
        ),
      ),
      child: ModularApp(module: AppModule()));

  runApp(configuredApp);
}
