import 'package:flutter/material.dart';
import 'package:pagina_de_marcas/ui/screens/brand/brand_spotlight_screen.dart';

import 'colors.dart';

void main() => runApp(
  MaterialApp(
    title: "Página de marcas",
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
              color:  MyColors.pink
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
  )
);

