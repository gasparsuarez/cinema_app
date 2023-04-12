import 'package:cinema_app/domain/entities/movie.dart';

abstract class MovieDatasouce {
  Future<List<Movie>> getNowPlaying({int page = 0});
}
