import 'package:netflix/domain/movies/entities/movies.dart';
import 'package:netflix/domain/tv/entities/tv.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {}

class MovieLoaded extends SearchState {
  final List<MovieEntity> movies;
  MovieLoaded({required this.movies});
}

class TvLoaded extends SearchState {
  final List<TVEntity> tvs;
  TvLoaded({required this.tvs});
}

class SearchFailure extends SearchState {
  final String errorMessage;
  SearchFailure({required this.errorMessage});
}
