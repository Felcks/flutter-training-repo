import 'package:json_annotation/json_annotation.dart';

part 'image_response.g.dart';

@JsonSerializable()

class ImageResponse{

  String ImageUrl;

  ImageResponse();

  factory ImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ImageResponseToJson(this);


}