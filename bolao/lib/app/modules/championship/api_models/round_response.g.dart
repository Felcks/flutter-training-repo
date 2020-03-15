// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoundResponse _$RoundResponseFromJson(Map<String, dynamic> json) {
  return RoundResponse()
    ..round_number = json['round_number'] as int
    ..championship_id = json['championship_id'] as String
    ..start_date = json['start_date'] as String;
}

Map<String, dynamic> _$RoundResponseToJson(RoundResponse instance) =>
    <String, dynamic>{
      'round_number': instance.round_number,
      'championship_id': instance.championship_id,
      'start_date': instance.start_date,
    };
