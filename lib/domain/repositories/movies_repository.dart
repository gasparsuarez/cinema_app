import 'package:cinema_app/domain/entities/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getNowPlaying({int page = 0});
  
  Future<List<Movie>> getPopular({int page = 0});

  Future<List<Movie>> getTopRated({int page = 0});

  Future<List<Movie>> getUpComing({int page = 0});

  Future<Movie> getMovieById( String id);
}
