import 'package:bolao/app/modules/championship/models/championship.dart';
import 'package:dio/dio.dart';

class ChampionshipRepository {
  final Dio dio;

  ChampionshipRepository(this.dio);

  List<Championship> championships;

  Future<List<Championship>> getChampionships() async {
    if (championships == null)
      championships = [
        Championship("Brasileirão"),
        Championship("Copa do Brasil"),
      ];
    return championships;
  }
}
