import 'package:dartz/dartz.dart';
import 'package:netflix/core/usecase/usecase.dart';
import 'package:netflix/domain/movies/repositories/movies.dart';
import 'package:netflix/service_locator.dart';

class GetRecommendationMoviesUseCase extends useCase<Either, int> {
  @override
  Future<Either> call({int? params}) async {
    return await sl<MovieRepository>().getRecommendationMovies(params!);
  }
}
