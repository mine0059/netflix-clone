import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:netflix/core/constants/api_url.dart';
import 'package:netflix/core/network/dio_client.dart';
import 'package:netflix/service_locator.dart';

abstract class TVService {
  Future<Either> getPopularTv();
  Future<Either> getRecommendationTVs(int tvId);
  Future<Either> getSimilarTVs(int tvId);
  Future<Either> getKeywords(int tvId);
  Future<Either> searchTV(String query);
}

class TvServiceImpl implements TVService {
  @override
  Future<Either> getPopularTv() async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.popularTV,
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getRecommendationTVs(int tvId) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.tv}$tvId/recommendations',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getSimilarTVs(int tvId) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.tv}$tvId/similar',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getKeywords(int tvId) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.tv}$tvId/keywords',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> searchTV(String query) async {
    try {
      var response = await sl<DioClient>().get(
        '${ApiUrl.search}tv/$query',
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
