import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_api/app/pages/home/home_controller.dart';
import 'package:pokemon_api/app/shared/models/pokemon_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedéx"),
      ),
      body: Observer(
        builder: (_) {
          if (homeController.pokemons.error != null) {
            return Center(
              child: RaisedButton(
                onPressed: () {
                  homeController.fetchPokemon();
                },
                child: Text("Error"),
              ),
            );
          }

          if (homeController.pokemons.value == null) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: homeController.pokemons.value.length,
            itemBuilder: (BuildContext context, int index) {
              PokemonModel pokemon = homeController.pokemons.value[index];
              return ListTile(title: Text(pokemon.name));
            },
          );
        },
      ),
    );
  }
}
