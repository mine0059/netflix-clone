import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/common/cubit/generic_data_cubit.dart';
import 'package:netflix/common/widgets/movies/movie_card.dart';
import 'package:netflix/domain/movies/entities/movies.dart';
import 'package:netflix/domain/movies/usecases/get_similar_movies.dart';
import 'package:netflix/service_locator.dart';

class SimilarMovies extends StatelessWidget {
  const SimilarMovies({required this.movieId, super.key});
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<List<MovieEntity>>(
          sl<GetSimilarMoviesUseCase>(),
          params: movieId,
        ),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is DataLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Similar',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return MovieCard(
                        movieEntity: state.data[index],
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemCount: state.data.length,
                  ),
                )
              ],
            );
          }

          if (state is FailureLoadData) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return Container();
        },
      ),
    );
  }
}
