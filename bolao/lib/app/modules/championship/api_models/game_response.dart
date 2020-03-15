import 'package:bolao/app/modules/championship/api_models/game_team_response.dart';
import 'package:bolao/app/modules/championship/models/game.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_response.g.dart';

@JsonSerializable()
class GameResponse {
  String championship_id;
  int round_number;
  GameTeamResponse owner_team;
  GameTeamResponse visiting_team;

  GameResponse();

  factory GameResponse.fromJson(Map<String, dynamic> json) =>
      _$GameResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GameResponseToJson(this);

  static Game toDomain(GameResponse response) {
    return Game(
        GameTeamResponse.toDomain(response.owner_team),
        GameTeamResponse.toDomain(response.visiting_team),
        response.championship_id,
        response.round_number);
  }
}
