import 'package:cinema_app/infraestructure/mappers/movie_mapper.dart';
import 'package:cinema_app/infraestructure/models/moviedb/movie_details.dart';
import 'package:cinema_app/infraestructure/models/moviedb/moviedb_response.dart';

import '../../config/constants/enviroment.dart';
import 'package:dio/dio.dart';

import 'package:cinema_app/domain/datasources/movies_datasource.dart';
import 'package:cinema_app/domain/entities/movie.dart';

class MoviedbDatasource extends MoviesDatasouce {
  final dio = Dio(BaseOptions(baseUrl: 'https://api.themoviedb.org/3/', queryParameters: {
    'api_key': Enviroment.theMovieDBkey,
    'language': 'es-MX',
  }));

  List<Movie> _jsonToMovie(Map<String, dynamic> json) {
    final movieDBresponse = MovieDbResponse.fromJson(json);
    final List<Movie> movies = movieDBresponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBtoEntity(moviedb))
        .toList();
    return movies;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 0}) async {
    final response = await dio.get('/movie/now_playing', queryParameters: {'page': page});
    return _jsonToMovie(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 0}) async {
    final response = await dio.get('/movie/popular', queryParameters: {'page': page});
    return _jsonToMovie(response.data);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 0}) async {
    final response = await dio.get('/movie/top_rated', queryParameters: {'page': page});
    return _jsonToMovie(response.data);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 0}) async {
    final response = await dio.get('/movie/upcoming', queryParameters: {'page': page});
    return _jsonToMovie(response.data);
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');

    if (response.statusCode != 200) throw Exception('Movie with id: $id Not found');

    final movieDb = MovieDetails.fromJson(response.data);
    final Movie movie = MovieMapper.movieDetailToEntity(movieDb);

    return movie;
  }
}
