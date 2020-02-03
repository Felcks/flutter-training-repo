// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingResponse _$RatingResponseFromJson(Map<String, dynamic> json) {
  return RatingResponse()
    ..Average = (json['Average'] as num)?.toDouble()
    ..Count = json['Count'] as int;
}

Map<String, dynamic> _$RatingResponseToJson(RatingResponse instance) =>
    <String, dynamic>{
      'Average': instance.Average,
      'Count': instance.Count,
    };
