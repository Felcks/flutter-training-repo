import 'package:flutter/material.dart';
import 'config/app_config.dart';
import 'ui/home.dart';

void main() {

  var configuredApp = new AppConfig(
      appName: 'Bolão de Computação',
      flavorName: 'Bolão de Computação',
      apiBaseUrl: 'api-offpremiumv2.mobfiq.com.br',
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
          color: Colors.black,
          textTheme: TextTheme(
            title: TextStyle(
                color: Colors.white,
                fontSize: 20
            ),
            body1: TextStyle(
                color: Colors.white
            ),
            button: TextStyle(
                color: Colors.white
            ),
          ),
          iconTheme: IconThemeData(
              color: Colors.white
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
      child: Home()
  );

  runApp(MaterialApp(
    title: configuredApp.appName,
    theme: configuredApp.themeData,
    home: Home(),
  ));
}
