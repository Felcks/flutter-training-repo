import 'game.dart';

class Round{

  int number;
  List<Game> games;

  Round(this.number, this.games);

  String getTitle(){
    return "Rodada ${number+1}";
  }

  String getAllGamesText(){
    
    String text = "";
    games.forEach((game){

      if(text.isEmpty){
        text += "${game.getScoreboard()}";
      }
      else {
        text += "\n${game.getScoreboard()}";
      }
    });

    return text;
  }
}
