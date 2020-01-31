// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BrandResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandResponse _$BrandResponseFromJson(Map<String, dynamic> json) {
  return BrandResponse()
    ..Id = json['Id'] as int
    ..Name = json['Name'] as String
    ..Active = json['Active'] as bool;
}

Map<String, dynamic> _$BrandResponseToJson(BrandResponse instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'Name': instance.Name,
      'Active': instance.Active,
    };
