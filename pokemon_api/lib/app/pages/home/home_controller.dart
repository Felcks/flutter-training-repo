import 'package:mobx/mobx.dart';
import 'package:pokemon_api/app/shared/models/pokemon_model.dart';
import 'package:pokemon_api/app/shared/repositories/poke_repository.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  
  PokeRepository pokeRepository;

  @observable
  ObservableFuture<List<PokemonModel>> pokemons;

  _HomeControllerBase(this.pokeRepository){
    fetchPokemon();
  }

  @action
  fetchPokemon(){
    pokemons = pokeRepository.getAllPokemon().asObservable();
  }
}