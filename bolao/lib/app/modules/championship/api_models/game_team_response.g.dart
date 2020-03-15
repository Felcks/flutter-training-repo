// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_team_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameTeamResponse _$GameTeamResponseFromJson(Map<String, dynamic> json) {
  return GameTeamResponse()
    ..score = json['score'] as int
    ..team = json['team'] == null
        ? null
        : TeamResponse.fromJson(json['team'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GameTeamResponseToJson(GameTeamResponse instance) =>
    <String, dynamic>{
      'score': instance.score,
      'team': instance.team,
    };
