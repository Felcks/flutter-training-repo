import 'package:json_annotation/json_annotation.dart';

part 'rating_response.g.dart';

@JsonSerializable()

class RatingResponse{

  double Average;
  int Count;

  RatingResponse();

  factory RatingResponse.fromJson(Map<String, dynamic> json) =>
      _$RatingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RatingResponseToJson(this);


}