import 'data_source.dart';
import 'local_data_source.dart';
import 'remote_data_source.dart';

class DataSourceFactory {
  DataSourceFactory({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;

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
