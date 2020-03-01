import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokemon_api/app/shared/models/pokemon_model.dart';

class PokeRepository{

  final Dio dio;

  PokeRepository(this.dio);

  Future<List<PokemonModel>> getAllPokemon() async{
    var response = await dio.get('pokemon');

    List<PokemonModel> list = [];

      for(var json in (response.data['results'] as List)){
        PokemonModel pokemon = PokemonModel();
        pokemon.name = json['name']; 
        list.add(pokemon);
      }
      
       print(list[0].name);


    print(response.statusCode);

    return list;
  }

}