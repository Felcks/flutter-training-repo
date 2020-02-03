// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sku_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SkuResponse _$SkuResponseFromJson(Map<String, dynamic> json) {
  return SkuResponse()
    ..Name = json['Name'] as String
    ..Images = (json['Images'] as List)
        ?.map((e) => e == null
            ? null
            : ImageResponse.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..Sellers = (json['Sellers'] as List)
        ?.map((e) => e == null
            ? null
            : SellerResponse.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SkuResponseToJson(SkuResponse instance) =>
    <String, dynamic>{
      'Name': instance.Name,
      'Images': instance.Images,
      'Sellers': instance.Sellers,
    };
