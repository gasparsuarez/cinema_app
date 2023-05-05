import 'package:cinema_app/domain/datasources/movies_datasource.dart';
import 'package:cinema_app/domain/entities/movie.dart';

import '../../domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDatasouce moviesDatasource;

  MovieRepositoryImpl(this.moviesDatasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 0}) {
    return moviesDatasource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 0}) {
    return moviesDatasource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 0}) {
    return moviesDatasource.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getUpComing({int page = 0}) {
    return moviesDatasource.getUpcoming(page: page);
  }

  @override
  Future<Movie> getMovieById(String id) {
    return moviesDatasource.getMovieById(id);
  }
}
