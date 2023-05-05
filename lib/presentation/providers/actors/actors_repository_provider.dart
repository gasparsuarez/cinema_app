import '../../../infraestructure/repositories/actor_repository_impl.dart';
import 'package:cinema_app/infraestructure/datasource/actor_moviedb_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Provider inmutable que nunca cambiara
final actorRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMoviedbDatasource());
});
