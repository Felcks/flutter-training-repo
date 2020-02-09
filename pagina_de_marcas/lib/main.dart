import 'package:flutter/material.dart';
import 'package:pagina_de_marcas/ui/screens/brand/brand_spotlight_screen.dart';

import 'colors.dart';

import 'config/app_config.dart';

// We can remove this line here:
// void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Call AppConfig.of(context) anywhere to obtain the
    // environment specific configuration
    var config = AppConfig.of(context);
    print(config.appName);

    return new  MaterialApp(
      title: config.appName,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: MyColors.pink,
        appBarTheme: AppBarTheme(
          elevation: 0,
          textTheme: TextTheme(
            title: TextStyle(
                color: MyColors.pink,
                fontSize: 20
            ),
            body1: TextStyle(
                color: MyColors.pink
            ),
            button: TextStyle(
                color: MyColors.pink
            ),
          ),
          iconTheme: IconThemeData(
              color: MyColors.pink
          ),
        ),
        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
      ),
      home: BrandSpotlightScreen(),
    );
  }
}

