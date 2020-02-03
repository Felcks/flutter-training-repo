import 'package:json_annotation/json_annotation.dart';

part 'search_product_request.g.dart';

@JsonSerializable()

class SearchProductRequest{

  String Query;
  int Offset;
  int Size;

  SearchProductRequest(this.Query, this.Offset, this.Size);

  factory SearchProductRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchProductRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SearchProductRequestToJson(this);



}