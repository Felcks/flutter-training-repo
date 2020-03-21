import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:pagina_de_marcas/ui/screens/brand/spotlight/brand_spotlight_screen.dart';
import 'config/app_config.dart';

// We can remove this line here:
// void main() => runApp(new MyApp());

class BrandPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Call AppConfig.of(context) anywhere to obtain the
    // environment specific configuration
    var config = AppConfig.of(context);

    return PlatformProvider(
      initialPlatform: TargetPlatform.iOS,
      builder: (BuildContext context) => PlatformApp(
        debugShowCheckedModeBanner: false,
        android: (_) => MaterialAppData(
          theme: config.themeData,
        ),
        title: config.appName,
        home: BrandSpotlightScreen(),
      ),
    );
  }
}
