import 'package:data/src/repository/cache_storage_repository.dart';
import 'package:data/src/source/data_source.dart';

class LocalDataSource extends DataSource {
  LocalDataSource(this.cacheStorageRepository);

  final CacheStorageRepository cacheStorageRepository;
}
