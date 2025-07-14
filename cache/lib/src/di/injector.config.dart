// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cache/src/cache_storage_repository_impl.dart' as _i181;
import 'package:cache/src/db/demo_db.dart' as _i996;
import 'package:cache/src/db_provider.dart' as _i720;
import 'package:cache/src/mapper/articles_entity_mapper.dart' as _i81;
import 'package:data/data.dart' as _i437;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt $initCacheGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i81.ArticlesEntityMapper>(() => _i81.ArticlesEntityMapper());
    gh.singleton<_i996.DemoDB>(() => _i996.DemoDB());
    gh.singleton<_i720.DBProvider>(() => _i720.DBProvider(gh<_i996.DemoDB>()));
    gh.factory<_i437.CacheStorageRepository>(
        () => _i181.CacheStorageRepositoryImpl(
              dbProvider: gh<_i720.DBProvider>(),
              articlesEntityMapper: gh<_i81.ArticlesEntityMapper>(),
            ));
    return this;
  }
}
