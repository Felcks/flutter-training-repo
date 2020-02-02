// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandResponse _$BrandResponseFromJson(Map<String, dynamic> json) {
  return BrandResponse()
    ..Id = json['Id'] as int
    ..Name = json['Name'] as String
    ..Active = json['Active'] as bool
    ..ImageUrl = json['ImageUrl'] as String;
}

Map<String, dynamic> _$BrandResponseToJson(BrandResponse instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'Name': instance.Name,
      'Active': instance.Active,
      'ImageUrl': instance.ImageUrl,
    };
