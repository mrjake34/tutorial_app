import 'package:get_it/get_it.dart';
import 'package:tutorial_app/feature/home/service/home_service.dart';
import 'package:tutorial_app/feature/photos/service/photos_service.dart';
import 'package:tutorial_app/product/core/service/dio_service_manager.dart';
import 'package:tutorial_app/product/core/service/service_manager.dart';
import 'package:tutorial_app/product/utils/cache/cache_manager.dart';
import 'package:tutorial_app/product/utils/shared/shared_manager.dart';

import '../remote_config/remote_config_manager.dart';

abstract class ProductStateContainer {
  static final _getIt = GetIt.instance;

  static void setup() {
    _getIt
      ..registerSingleton(RemoteConfigManager.remoteConfig)
      ..registerLazySingleton(() async => await SharedManager.initInstance())
      ..registerFactory(() => HomeService(_getIt.get<DioServiceManager>(
          param1: 'https://jsonplaceholder.typicode.com/')))
      ..registerFactory(() => PhotosService(_getIt.get<ServiceManager>(
          param1: 'https://api.slingacademy.com/v1/sample-data/')))
      ..registerFactoryParam<DioServiceManager, String, Null>(
          (param1, param2) => DioServiceManager(baseUrl: param1))
      ..registerFactoryParam<ServiceManager, String, Null>(
          (param1, param2) => ServiceManager(param1))
      ..registerSingleton(CacheManager.instance);
  }

  static void setupForTest() {
    _getIt
      ..registerFactory(() => HomeService(_getIt.get<DioServiceManager>(
          param1: 'https://jsonplaceholder.typicode.com/')))
      ..registerFactory(() => PhotosService(_getIt.get<ServiceManager>(
          param1: 'https://api.slingacademy.com/v1/sample-data/')))
      ..registerFactoryParam<DioServiceManager, String, Null>(
          (param1, param2) => DioServiceManager(baseUrl: param1))
      ..registerFactoryParam<ServiceManager, String, Null>(
          (param1, param2) => ServiceManager(param1))
      ..registerSingleton(CacheManager.instance);
  }

  static T get<T extends Object>() => _getIt.get<T>();
}
