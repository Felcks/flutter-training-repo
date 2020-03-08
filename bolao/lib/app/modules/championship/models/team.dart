import 'package:bolao/app/modules/championship/models/team_base.dart';
import 'package:mobx/mobx.dart';
part 'team.g.dart';

class Team = _TeamBase with _$Team;

abstract class _TeamBase extends TeamBase with Store  {
  
  @observable
  int score;

  _TeamBase(String name, String imageURL, this.score) : super(name, imageURL);

  @action
  setScore(int newScore) => score = newScore;
}