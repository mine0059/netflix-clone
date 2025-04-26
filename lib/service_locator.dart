import 'package:get_it/get_it.dart';
import 'package:netflix/core/network/dio_client.dart';
import 'package:netflix/data/auth/repositories/auth.dart';
import 'package:netflix/data/auth/sources/auth_api_service.dart';
import 'package:netflix/domain/auth/repositories/auth.dart';
import 'package:netflix/domain/auth/usecases/is_loggedin.dart';
import 'package:netflix/domain/auth/usecases/signin.dart';
import 'package:netflix/domain/auth/usecases/signup.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());

  //Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // usecase
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsLoggedinUseCase>(IsLoggedinUseCase());
}
