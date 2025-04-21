import 'package:dartz/dartz.dart';

abstract class AuthApiService {
  Future<Either> signup();
  Future<Either> signin();
}
