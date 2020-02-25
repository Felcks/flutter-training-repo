import 'package:bolao_de_computacao/model/team_base.dart';

class Team extends TeamBase{

  int score;

  Team(String name, String imageURL, this.score) : super(name, imageURL);


}