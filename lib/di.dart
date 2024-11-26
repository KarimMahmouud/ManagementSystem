import 'package:crud/business_logic_layer/cubit/cubit/tasks_cubit.dart';
import 'package:crud/data_layer/repository/tasks_repository.dart';
import 'package:crud/data_layer/web_services/tasks_srevices.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void iniGetIt() {
  getIt.registerLazySingleton<TasksCubit>(() => TasksCubit(getIt()));
  getIt.registerLazySingleton<TasksRepository>(() => TasksRepository(getIt()));
  getIt.registerLazySingleton<TasksWebServices>(() => TasksWebServices(creatAndSetupDio()));
}

Dio creatAndSetupDio() {
  Dio dio = Dio();

  // dio.options.connectTimeout = const Duration(seconds: 10);
  // dio.options.receiveTimeout = const Duration(seconds: 1);

  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    error: true,
    requestHeader: false,
    responseHeader: false,
    request: true,
    requestBody: true,
  ));

  return dio;
}
