import 'package:cinema_app/domain/entities/actor.dart';
import 'package:cinema_app/infraestructure/mappers/actor_mapper.dart';
import 'package:cinema_app/infraestructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

import '../../config/constants/enviroment.dart';
import '../../domain/datasources/actor_datasource.dart';

class ActorMoviedbDatasource extends ActorsDatasource {
  final dio = Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/3/', queryParameters: {
    'api_key': Enviroment.theMovieDBkey,
    'language': 'es-MX',
  }));

  @override
  Future<List<Actor>> getActorByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');
    final castResponse = CreditsResponse.fromJson(response.data);

    final List<Actor> actors = castResponse.cast.map((e) => ActorMapper.castToEntity(e)).toList();
    return actors;
  }
}
