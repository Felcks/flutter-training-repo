import 'package:bolao/app/utils/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

     var config = AppConfig.of(context);

    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: config.appName,
      theme: config.themeData,
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
