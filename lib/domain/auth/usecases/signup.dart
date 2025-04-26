// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:netflix/core/usecase/usecase.dart';
import 'package:netflix/data/auth/models/auth/signup_req_params.dart';
import 'package:netflix/domain/auth/repositories/auth.dart';
import 'package:netflix/service_locator.dart';

class SignupUseCase extends useCase<Either, SignupReqParams> {
  @override
  Future<Either> call({SignupReqParams? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }
}
