import 'game.dart';
import 'package:mobx/mobx.dart';
part 'round.g.dart';

class Round = _RoundBase with _$Round;

abstract class _RoundBase with Store {
  @observable
  int number;

  @observable
  List<Game> games;

  _RoundBase(this.number, this.games);

  String getTitle() {
    return "Rodada ${number + 1}";
  }

  String getAllGamesText() {
    String text = "";
    games.forEach((game) {
      if (text.isEmpty) {
        text += "${game.getScoreboard()}";
      } else {
        text += "\n${game.getScoreboard()}";
      }
    });

    return text;
  }
}
