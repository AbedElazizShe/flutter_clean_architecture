// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/src/articles_repository_impl.dart' as _i911;
import 'package:data/src/mapper/articles/articles_mapper.dart' as _i241;
import 'package:data/src/repository/articles_remote_repository.dart' as _i241;
import 'package:data/src/repository/cache_storage_repository.dart' as _i151;
import 'package:data/src/source/cache_data_source.dart' as _i689;
import 'package:data/src/source/data_source_factory.dart' as _i973;
import 'package:data/src/source/remote_data_source.dart' as _i498;
import 'package:domain/domain.dart' as _i494;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt $initDataGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i241.ArticlesMapper>(() => _i241.ArticlesMapper());
    gh.singleton<_i498.RemoteDataSource>(() => _i498.RemoteDataSource(
        articlesRemoteRepository: gh<_i241.ArticlesRemoteRepository>()));
    gh.singleton<_i689.CacheDataSource>(
        () => _i689.CacheDataSource(gh<_i151.CacheStorageRepository>()));
    gh.singleton<_i973.DataSourceFactory>(() => _i973.DataSourceFactory(
          remoteDataSource: gh<_i498.RemoteDataSource>(),
          localDataSource: gh<_i689.CacheDataSource>(),
        ));
    gh.factory<_i494.ArticlesRepository>(() => _i911.ArticlesRepositoryImpl(
          dataSourceFactory: gh<_i973.DataSourceFactory>(),
          articlesMapper: gh<_i241.ArticlesMapper>(),
        ));
    return this;
  }
}
