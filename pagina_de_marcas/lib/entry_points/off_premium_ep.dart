import 'package:flutter/material.dart';
import 'package:pagina_de_marcas/config/app_config.dart';

import '../main.dart';

void main() {
  var configuredApp = new AppConfig(
    appName: 'Off Premium',
    flavorName: 'OffPremium',
    apiBaseUrl: 'https://api.example.com/',
    child: MyApp(),
  );

  runApp(configuredApp);
}