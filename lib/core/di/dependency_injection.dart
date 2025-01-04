import 'package:dio/dio.dart';
import 'package:flutter_advanced/core/networking/api_service.dart';
import 'package:flutter_advanced/core/networking/dio_factory.dart';
import 'package:flutter_advanced/features/login/data/repos/login_repo.dart';
import 'package:flutter_advanced/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter_advanced/features/signup/data/repos/signup_repo.dart';
import 'package:flutter_advanced/features/signup/logic/cubit/signup_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/apis/home_api_service.dart';
import '../../features/home/data/repos/home_repo_.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //! dio and api service
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //! login repo and cubit
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiService>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));

  //! login repo and cubit
  getIt
      .registerLazySingleton<SignupRepo>(() => SignupRepo(getIt<ApiService>()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt<SignupRepo>()));

  //! home api services repo and cubit
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt
      .registerLazySingleton<HomeRepo>(() => HomeRepo(getIt<HomeApiService>()));
  // getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));
}
