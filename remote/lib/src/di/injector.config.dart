// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/data.dart' as _i437;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:remote/src/api/api_service.dart' as _i569;
import 'package:remote/src/api/articles_service.dart' as _i1031;
import 'package:remote/src/api/endpoint_provider.dart' as _i223;
import 'package:remote/src/articles_remote_repository_impl.dart' as _i1035;
import 'package:remote/src/mapper/articles_entity_mapper.dart' as _i799;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt $initRemoteGetIt({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final apiService = _$ApiService();
    gh.factory<_i799.ArticlesEntityMapper>(() => _i799.ArticlesEntityMapper());
    gh.singleton<_i361.Dio>(() => apiService.init());
    gh.singleton<_i223.EndpointProvider>(
        () => _i223.EndpointProvider(gh<_i361.Dio>()));
    gh.singleton<_i1031.ArticlesService>(
        () => _i1031.ArticlesService(gh<_i223.EndpointProvider>()));
    gh.factory<_i437.ArticlesRemoteRepository>(
        () => _i1035.ArticlesRemoteRepositoryImpl(
              articlesService: gh<_i1031.ArticlesService>(),
              articlesEntityMapper: gh<_i799.ArticlesEntityMapper>(),
            ));
    return this;
  }
}

class _$ApiService extends _i569.ApiService {}
