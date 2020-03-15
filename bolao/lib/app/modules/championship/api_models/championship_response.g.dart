// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'championship_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChampionshipResponse _$ChampionshipResponseFromJson(Map<String, dynamic> json) {
  return ChampionshipResponse()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..season = json['season'] as String
    ..current_round = json['current_round'] as int
    ..type = json['type'] as int
    ..title_image_url = json['title_image_url'] as String;
}

Map<String, dynamic> _$ChampionshipResponseToJson(
        ChampionshipResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'season': instance.season,
      'current_round': instance.current_round,
      'type': instance.type,
      'title_image_url': instance.title_image_url,
    };
