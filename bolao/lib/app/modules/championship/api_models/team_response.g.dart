// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamResponse _$TeamResponseFromJson(Map<String, dynamic> json) {
  return TeamResponse()
    ..name = json['name'] as String
    ..image_url = json['image_url'] as String;
}

Map<String, dynamic> _$TeamResponseToJson(TeamResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image_url': instance.image_url,
    };
