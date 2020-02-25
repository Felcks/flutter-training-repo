import 'game.dart';

class Round{

  int number;
  List<Game> games;

  Round(this.number, this.games);

  String getRoundTitle(){
    return "Rodada $number";
  }

  String getAllGamesText(){
    
    String text = "";
    games.forEach((game){

      if(text.isEmpty){
        text = "$text/n${game.getScoreboard()}";
      }
      else {
        text = "${game.getScoreboard()}";
      }
    });

    return text;
  }

}
