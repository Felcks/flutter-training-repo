import 'package:flutter/material.dart';
import 'package:pagina_de_marcas/config/app_config.dart';
import 'package:pagina_de_marcas/ui/screens/brand/brand_spotlight_screen.dart';

import '../main.dart';

void main() {
  var configuredApp = new AppConfig(
    appName: 'Epoca Cosmeticos',
    flavorName: 'EpocaCosmeticos',
    apiBaseUrl: 'https://api.example.com/',
    child: MyApp(),
  );

  runApp(configuredApp);
}