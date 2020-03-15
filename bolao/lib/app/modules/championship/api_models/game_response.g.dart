// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameResponse _$GameResponseFromJson(Map<String, dynamic> json) {
  return GameResponse()
    ..championship_id = json['championship_id'] as String
    ..round_number = json['round_number'] as int
    ..owner_team = json['owner_team'] == null
        ? null
        : GameTeamResponse.fromJson(json['owner_team'] as Map<String, dynamic>)
    ..visiting_team = json['visiting_team'] == null
        ? null
        : GameTeamResponse.fromJson(
            json['visiting_team'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GameResponseToJson(GameResponse instance) =>
    <String, dynamic>{
      'championship_id': instance.championship_id,
      'round_number': instance.round_number,
      'owner_team': instance.owner_team,
      'visiting_team': instance.visiting_team,
    };
