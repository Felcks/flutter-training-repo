import 'package:json_annotation/json_annotation.dart';

part 'BrandResponse.g.dart';

@JsonSerializable()

class BrandResponse{

  int Id;
  String Name;
  bool Active;

  BrandResponse();

  factory BrandResponse.fromJson(Map<String, dynamic> json) =>
      _$BrandResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BrandResponseToJson(this);
}