import 'package:get_it/get_it.dart';
import 'package:netflix/core/network/dio_client.dart';

final s1 = GetIt.instance;

void setupServiceLocator() {
  s1.registerSingleton<DioClient>(DioClient());
}
