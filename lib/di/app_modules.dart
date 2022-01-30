import 'package:cache/cache.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter_clean_architecture/features/articles/di/articles_modules.dart';
import 'package:get_it/get_it.dart';
import 'package:remote/remote.dart';

class AppModules {
  factory AppModules() => _singleton;

  AppModules._internal();

  static final AppModules _singleton = AppModules._internal();

  final GetIt injector = GetIt.instance;

  void init() {
    // Remote
    injector..registerSingleton<ApiService>(ApiService());
    // Local
    // ..registerSingleton<DemoDB>(DemoDB())
    // ..registerSingleton<SecureStorageService>(SecureStorageService())
    //  ..registerSingleton<LocalStorageService>(LocalStorageService(
    //      LocalStorageProvider(
    //          injector<SecureStorageService>().init(), injector())));
    // Articles
    articlesDependencies();
    // Data
    dataDependencies();
    // Domain
    initArticlesModules();
  }

  void articlesDependencies() {
    injector
      ..registerSingleton<ArticlesEntityMapper>(ArticlesEntityMapper())
      ..registerSingleton<ArticlesService>(
          ArticlesService(EndpointProvider(injector<ApiService>().init())))
      ..registerSingleton<ArticlesRemoteRepository>(
          ArticlesRemoteRepositoryImpl(
        articlesService: injector(),
        articlesEntityMapper: injector(),
      ));
  }

  void dataDependencies() {
    injector
      ..registerFactory<RemoteDataSource>(
          () => RemoteDataSource(articlesRemoteRepository: injector()))
      ..registerFactory<CacheStorageRepository>(
          () => CacheStorageRepositoryImpl())
      ..registerFactory<LocalDataSource>(() => LocalDataSource(injector()))
      ..registerSingleton<DataSourceFactory>(DataSourceFactory(
          remoteDataSource: injector(), localDataSource: injector()))
      ..registerSingleton<ArticlesMapper>(ArticlesMapper())
      ..registerSingleton<ArticlesRepository>(ArticlesRepositoryImpl(
        dataSourceFactory: injector(),
        articlesMapper: injector(),
      ));
    // ..registerSingleton<LocalRepository>(LocalRepositoryImpl(
    //   dataSourceFactory: injector(),
    // ))
    // ..registerSingleton<DeviceRepository>(
    //     DeviceRepositoryImpl(dataSourceFactory: injector()));
  }
}
