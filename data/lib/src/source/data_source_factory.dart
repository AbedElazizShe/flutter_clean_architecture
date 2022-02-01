import 'package:injectable/injectable.dart';

import 'data_source.dart';
import 'cache_data_source.dart';
import 'remote_data_source.dart';

@singleton
class DataSourceFactory {
  DataSourceFactory({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final RemoteDataSource remoteDataSource;
  final CacheDataSource localDataSource;

  DataSource getDataSource({bool isCached = false, bool force = false}) {
    if (isCached && !force) {
      return getLocalDataSource();
    } else {
      return getRemoteDataSource();
    }
  }

  DataSource getRemoteDataSource() => remoteDataSource;

  DataSource getLocalDataSource() => localDataSource;
}
