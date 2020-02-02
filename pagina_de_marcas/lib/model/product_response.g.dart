// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) {
  return ProductResponse()
    ..Skus = (json['Skus'] as List)
        ?.map((e) =>
            e == null ? null : SkuResponse.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..Name = json['Name'] as String;
}

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'Skus': instance.Skus,
      'Name': instance.Name,
    };
