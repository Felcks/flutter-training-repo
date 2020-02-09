import 'package:flutter/material.dart';
import 'package:pagina_de_marcas/config/app_config.dart';

import '../main.dart';

void main() {
  var configuredApp = new AppConfig(
    appName: 'Época Cosmeticos',
    flavorName: 'EpocaCosmeticos',
    apiBaseUrl: 'https://api.example.com/',
      themeData: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xffC21581),
        accentColor: Color(0xffC21581),
        backgroundColor: Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: Color(0xffC21581),
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.white,
          textTheme: TextTheme(
            title: TextStyle(
                color: Color(0xffC21581),
                fontSize: 20
            ),
            body1: TextStyle(
                color: Color(0xffC21581)
            ),
            button: TextStyle(
                color: Color(0xffC21581)
            ),
          ),
          iconTheme: IconThemeData(
              color: Color(0xffC21581)
          ),
        ),
        buttonTheme: ButtonThemeData(
            buttonColor: Color(0xffC21581),
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
                side: BorderSide(color: Color(0xffC21581))
            )
        ),
        iconTheme: IconThemeData(
            color: Color(0xffC21581)
        ),
      ),
      child: MyApp()
  );

  runApp(configuredApp);
}