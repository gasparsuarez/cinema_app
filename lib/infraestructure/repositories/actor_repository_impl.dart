import 'package:cinema_app/domain/datasources/actor_datasource.dart';
import 'package:cinema_app/domain/entities/actor.dart';
import 'package:cinema_app/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {
  final ActorsDatasource datasource;

  ActorRepositoryImpl(this.datasource);

  @override
  Future<List<Actor>> getActorByMovie(String movieId) {
    return datasource.getActorByMovie(movieId);
  }
}
