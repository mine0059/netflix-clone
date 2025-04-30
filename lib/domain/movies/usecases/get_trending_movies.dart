import 'package:dartz/dartz.dart';
import 'package:netflix/core/usecase/usecase.dart';
import 'package:netflix/domain/movies/repositories/movies.dart';
import 'package:netflix/service_locator.dart';

class GetTrendingMoviesUseCase extends useCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<MovieRepository>().getTrendingMovies();
  }
}
