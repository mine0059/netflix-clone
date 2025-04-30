import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netflix/domain/movies/entities/movies.dart';
import 'package:netflix/domain/movies/usecases/get_trending_movies.dart';
import 'package:netflix/service_locator.dart';

part 'trendings_state.dart';

class TrendingsCubit extends Cubit<TrendingsState> {
  TrendingsCubit() : super(TrendingsMoviesLoading());

  void getTrendingMovies() async {
    var returnedData = await sl<GetTrendingMoviesUseCase>().call();
    returnedData.fold((error) {
      emit(FailureLoadTrendingsMovies(errorMessage: error));
    }, (data) {
      emit(TrendingsMoviesLoaded(movies: data));
    });
  }
}
