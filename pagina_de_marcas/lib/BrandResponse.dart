import 'package:json_annotation/json_annotation.dart';

part 'BrandResponse.g.dart';

@JsonSerializable()

class BrandResponse{

  int Id;
  String Name;
  int Active;
}