import 'package:dartz/dartz.dart';
import 'package:netflix/core/usecase/usecase.dart';
import 'package:netflix/data/auth/models/auth/signin_req_params.dart';
import 'package:netflix/domain/auth/repositories/auth.dart';
import 'package:netflix/service_locator.dart';

class SigninUseCase extends useCase<Either, SigninReqParams> {
  @override
  Future<Either> call({SigninReqParams? params}) async {
    return await sl<AuthRepository>().signin(params!);
  }
}
