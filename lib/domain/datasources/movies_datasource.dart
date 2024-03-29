import 'package:cinema_app/domain/entities/movie.dart';

abstract class MoviesDatasouce {
  Future<List<Movie>> getNowPlaying({int page = 0});

  Future<List<Movie>> getPopular({int page = 0});

  Future<List<Movie>> getTopRated({int page = 0});

  Future<List<Movie>> getUpcoming({int page = 0});

  Future<Movie> getMovieById(String id);
}
