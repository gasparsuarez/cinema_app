import 'package:cinema_app/domain/entities/movie.dart';
import 'package:cinema_app/infraestructure/models/moviedb/movie_details.dart';
import 'package:cinema_app/infraestructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBtoEntity(MovieMovieDB moviedb) {
    return Movie(
        adult: moviedb.adult,
        backdropPath: (moviedb.backdropPath != '')
            ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
            : 'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-1-scaled.png',
        genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
        id: moviedb.id,
        originalLanguage: moviedb.originalLanguage,
        originalTitle: moviedb.originalTitle,
        overview: moviedb.overview,
        popularity: moviedb.popularity,
        posterPath: (moviedb.posterPath != '')
            ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
            : 'no-poster',
        releaseDate: moviedb.releaseDate,
        title: moviedb.title,
        video: moviedb.video,
        voteAverage: moviedb.voteAverage,
        voteCount: moviedb.voteCount);
  }

  static Movie movieDetailToEntity(MovieDetails moviedb) => Movie(
    adult: moviedb.adult,
        backdropPath: (moviedb.backdropPath != '')
            ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
            : 'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-1-scaled.png',
        genreIds: moviedb.genres.map((e) => e.name.toString()).toList(),
        id: moviedb.id,
        originalLanguage: moviedb.originalLanguage,
        originalTitle: moviedb.originalTitle,
        overview: moviedb.overview,
        popularity: moviedb.popularity,
        posterPath: (moviedb.posterPath != '')
            ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
            : 'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-1-scaled.png',
        releaseDate: moviedb.releaseDate,
        title: moviedb.title,
        video: moviedb.video,
        voteAverage: moviedb.voteAverage,
        voteCount: moviedb.voteCount);
}

