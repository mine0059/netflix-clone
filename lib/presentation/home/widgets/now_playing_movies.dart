import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/common/cubit/generic_data_cubit.dart';
import 'package:netflix/common/widgets/movies/movie_card.dart';
import 'package:netflix/domain/movies/entities/movies.dart';
import 'package:netflix/domain/movies/usecases/get_now_playing_movies.dart';
import 'package:netflix/service_locator.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData<List<MovieEntity>>(sl<GetNowPlayingMoviesUseCase>()),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
          builder: (context, state) {
        if (state is DataLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is DataLoaded) {
          return SizedBox(
            height: 300,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return MovieCard(movieEntity: state.data[index]);
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: state.data.length,
            ),
          );
        }

        if (state is FailureLoadData) {
          return Center(child: Text(state.errorMessage));
        }

        return Container();
      }),
    );
  }
}
