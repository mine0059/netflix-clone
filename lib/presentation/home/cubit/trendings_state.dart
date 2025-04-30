part of 'trendings_cubit.dart';

abstract class TrendingsState extends Equatable {
  const TrendingsState();

  @override
  List<Object> get props => [];
}

class TrendingsMoviesLoading extends TrendingsState {}

class TrendingsMoviesLoaded extends TrendingsState {
  final List<MovieEntity> movies;
  const TrendingsMoviesLoaded({
    required this.movies,
  });

  @override
  List<Object> get props => [movies];
}

class FailureLoadTrendingsMovies extends TrendingsState {
  final String errorMessage;
  const FailureLoadTrendingsMovies({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];
}
