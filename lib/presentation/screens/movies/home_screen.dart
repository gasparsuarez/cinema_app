import 'package:cinema_app/presentation/providers/providers.dart';
import 'package:cinema_app/presentation/widgets/shared/full_screen_loader.dart';

import 'package:cinema_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upComingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoaderProvider = ref.watch(initialLoadingProvider);

    if (initialLoaderProvider) return const FullScreenLoader();

    final nowPlayingMovieProvider = ref.watch(nowPlayingMoviesProvider);
    final movieSlideshowProvider = ref.watch(moviesSlideshowProvider);
    final popularsMoviesProvider = ref.watch(popularMoviesProvider);
    final topRatedMovieProvider = ref.watch(topRatedMoviesProvider);
    final upComingMovieProvider = ref.watch(upComingMoviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppBar(),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              MoviesSlideShow(movies: movieSlideshowProvider),
              MovieHorizontalListview(
                movies: nowPlayingMovieProvider,
                title: 'En cines',
                subTitle: 'Lunes 20',
                loadNextPage: () {
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                },
              ),
              MovieHorizontalListview(
                movies: popularsMoviesProvider,
                title: 'Popular',
                //subTitle: 'Lunes 20',
                loadNextPage: () {
                  ref.read(popularMoviesProvider.notifier).loadNextPage();
                },
              ),
              MovieHorizontalListview(
                movies: topRatedMovieProvider,
                title: 'Top Rated',
                //subTitle: 'Lunes 20',
                loadNextPage: () {
                  ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                },
              ),
              MovieHorizontalListview(
                movies: upComingMovieProvider,
                title: 'UpComing',
                //subTitle: 'Lunes 20',
                loadNextPage: () {
                  ref.read(upComingMoviesProvider.notifier).loadNextPage();
                },
              ),
            ],
          );
        }, childCount: 1))
      ],
    );
  }
}
