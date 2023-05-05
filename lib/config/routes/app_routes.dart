import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';

final GoRouter routerLinks = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    name: HomeScreen.routeName,
    path: '/',
    builder: (context, state) {
      return const HomeScreen();
    },
    routes: [
      GoRoute(
        name: MovieScreen.routeName,
        path: 'movie/:id',
        builder: (context, state) {
          final movieId = state.params['id'] ?? 'no-id';
          return MovieScreen(
            movieId: movieId,
          );
        },
      )
    ],
  ),
]);
