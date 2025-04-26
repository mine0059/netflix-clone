import 'package:dartz/dartz.dart';
import 'package:netflix/data/auth/models/auth/signin_req_params.dart';
import 'package:netflix/data/auth/models/auth/signup_req_params.dart';

abstract class AuthRepository {
  Future<Either> signup(SignupReqParams params);
  Future<Either> signin(SigninReqParams params);
  Future<bool> isLoggedIn();
}
