import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_api/app/pages/home/home_controller.dart';
import 'package:pokemon_api/app/pages/home/home_page.dart';
import 'package:pokemon_api/app/shared/repositories/poke_repository.dart';

import 'app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get<PokeRepository>())),
        Bind((i) => Dio(BaseOptions(baseUrl: "https://pokeapi.co/api/v2/"))),
        Bind((i) => PokeRepository(i.get<Dio>())),
      ];

  @override
  List<Router> get routers => [Router('/', child: (_, args) => HomePage())];

  @override
  Widget get bootstrap => AppWidget();
}
