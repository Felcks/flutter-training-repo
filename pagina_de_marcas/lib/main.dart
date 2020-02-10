import 'package:flutter/material.dart';
import 'package:pagina_de_marcas/ui/screens/brand/spotlight/brand_spotlight_screen.dart';

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

    return new  MaterialApp(
      title: config.appName,
      theme: config.themeData,
      home: BrandSpotlightScreen(),
    );
  }
}

