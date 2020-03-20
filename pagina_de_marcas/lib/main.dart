import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:pagina_de_marcas/ui/screens/search/search_result_screen.dart';

import 'config/app_config.dart';

// We can remove this line here:
// void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Call AppConfig.of(context) anywhere to obtain the
    // environment specific configuration
    var config = AppConfig.of(context);

    return new PlatformApp(
      title: config.appName,
      debugShowCheckedModeBanner: false,
      android: (_) => MaterialAppData(
        theme: config.themeData,
        debugShowCheckedModeBanner: false
      ),
      ios: (_) => CupertinoAppData(
        debugShowCheckedModeBanner: false
      ),
      home: SearchResultScreen("Calça"),
    );
  }
}
