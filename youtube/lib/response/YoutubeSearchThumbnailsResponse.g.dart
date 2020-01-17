// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'YoutubeSearchThumbnailsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YoutubeSearchThumbnailsResponse _$YoutubeSearchThumbnailsResponseFromJson(
    Map<String, dynamic> json) {
  return YoutubeSearchThumbnailsResponse(
    json['default'] == null
        ? null
        : YoutubeSearchThumbnailTypeResponse.fromJson(
            json['default'] as Map<String, dynamic>),
    json['medium'] == null
        ? null
        : YoutubeSearchThumbnailTypeResponse.fromJson(
            json['medium'] as Map<String, dynamic>),
    json['high'] == null
        ? null
        : YoutubeSearchThumbnailTypeResponse.fromJson(
            json['high'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$YoutubeSearchThumbnailsResponseToJson(
        YoutubeSearchThumbnailsResponse instance) =>
    <String, dynamic>{
      'default': instance.mDefault,
      'medium': instance.medium,
      'high': instance.high,
    };
