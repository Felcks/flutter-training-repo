import 'package:flutter/material.dart';
import 'package:pagina_de_marcas/config/app_config.dart';

import '../main.dart';

void main() {
  var configuredApp = new AppConfig(
    appName: 'Off Premium',
    flavorName: 'OffPremium',
    apiBaseUrl: 'https://api.example.com/',
    themeData: ThemeData(
      brightness: Brightness.light,
      primaryColor: Color(0xff000000),
      accentColor: Color(0xffD32F2F),
      backgroundColor: Colors.black,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: Colors.white,
        textTheme: TextTheme(
          title: TextStyle(
              color: Color(0xff000000),
              fontSize: 20
          ),
          body1: TextStyle(
              color: Color(0xff000000)
          ),
          button: TextStyle(
              color: Color(0xff000000)
          ),
        ),
        iconTheme: IconThemeData(
            color: Color(0xff000000)
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: Color(0xff000000),
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
            side: BorderSide(color: Color(0xaa000000))
        )
      ),
      iconTheme: IconThemeData(
          color: Colors.white
      ),
    ),
    child: MyApp()
  );

  runApp(configuredApp);
}