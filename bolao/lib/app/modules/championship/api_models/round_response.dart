import 'package:bolao/app/modules/championship/models/round.dart';
import 'package:json_annotation/json_annotation.dart';

part 'round_response.g.dart';

@JsonSerializable()
class RoundResponse {
  int round_number;
  String championship_id;
  String start_date;

  RoundResponse();

  factory RoundResponse.fromJson(Map<String, dynamic> json) =>
      _$RoundResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RoundResponseToJson(this);

  static Round toDomain(RoundResponse response) {
    return Round(response.round_number, []);
  }
}
