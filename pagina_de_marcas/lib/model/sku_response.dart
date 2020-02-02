import 'package:json_annotation/json_annotation.dart';
import 'package:pagina_de_marcas/model/image_response.dart';

part 'sku_response.g.dart';


@JsonSerializable()

class SkuResponse{

  SkuResponse();

  String Name;
  List<ImageResponse> Images;

  factory SkuResponse.fromJson(Map<String, dynamic> json) =>
      _$SkuResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SkuResponseToJson(this);


}