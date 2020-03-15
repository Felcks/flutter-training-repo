import 'package:bolao/app/modules/championship/api_models/team_response.dart';
import 'package:bolao/app/modules/championship/models/team.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_team_response.g.dart';

@JsonSerializable()
class GameTeamResponse {
  int score;
  TeamResponse team;

  GameTeamResponse();

   factory GameTeamResponse.fromJson(Map<String, dynamic> json) =>
      _$GameTeamResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GameTeamResponseToJson(this);

  static Team toDomain(GameTeamResponse response) {
    return Team.fromTeam(TeamResponse.toDomain(response.team), response.score,);
  }
}
