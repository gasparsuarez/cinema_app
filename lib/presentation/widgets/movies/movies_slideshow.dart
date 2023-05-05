import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/movie.dart';

class MoviesSlideShow extends StatelessWidget {
  final List<Movie> movies;

  const MoviesSlideShow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      height: 210,
      child: Swiper(
        autoplay: true,
        itemCount: movies.length,
        viewportFraction: 0.8,
        scale: 0.9,
        pagination: SwiperPagination(
          margin: const EdgeInsets.only(top: 0),
          builder: DotSwiperPaginationBuilder(
            activeColor: colors.primary,
            color: colors.secondary,
            space: 3,
          ),
        ),
        itemBuilder: (context, index) {
          return _Slide(movie: movies[index]);
        },
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final decorated = BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [BoxShadow(color: Colors.black45, blurRadius: 10, offset: Offset(0, 10))]);

    return Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: DecoratedBox(
          decoration: decorated,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              movie.backdropPath,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress != null) {
                  return const DecoratedBox(decoration: BoxDecoration(color: Colors.black12));
                }
                return GestureDetector(
                    onTap: () => context.push('/movie/${movie.id}'), child: child);
              },
            ),
          ),
        ));
  }
}
