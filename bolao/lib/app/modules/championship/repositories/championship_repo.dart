import 'package:bolao/app/modules/championship/models/championship.dart';
import 'package:dio/dio.dart';

class ChampionshipRepo {
  final Dio dio;

  ChampionshipRepo(this.dio);

  Future<List<Championship>> getChampionships() async {
    return [
      Championship("Brasileirão"),
      Championship("Copa do Brasil"),
    ];
  }
}
