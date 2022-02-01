// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:data/data.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../cache_storage_repository_impl.dart' as _i7;
import '../db/demo_db.dart' as _i4;
import '../db_provider.dart' as _i5;
import '../mapper/articles_entity_mapper.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initCacheGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.ArticlesEntityMapper>(() => _i3.ArticlesEntityMapper());
  gh.singleton<_i4.DemoDB>(_i4.DemoDB());
  gh.singleton<_i5.DBProvider>(_i5.DBProvider(get<_i4.DemoDB>()));
  gh.factory<_i6.CacheStorageRepository>(() => _i7.CacheStorageRepositoryImpl(
      dbProvider: get<_i5.DBProvider>(),
      articlesEntityMapper: get<_i3.ArticlesEntityMapper>()));
  return get;
}
