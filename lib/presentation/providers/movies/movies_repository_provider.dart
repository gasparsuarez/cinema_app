import 'package:cinema_app/infraestructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../infraestructure/datasource/moviedb_datasource.dart';

//Provider inmutable que nunca cambiara
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
});
