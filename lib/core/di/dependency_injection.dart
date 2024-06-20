import 'package:complet_project/core/networking/dio_factory.dart';
import 'package:complet_project/features/login/data/repos/login_repo.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/login/logic/cubit/login_cubit.dart';
import '../networking/api_service.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerSingleton<GetIt>(getIt);
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
}