import 'dart:io';

import 'package:cache/src/db/dao/articles_dao.dart';
import 'package:cache/src/db/entities/articles_entity.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'demo_db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [ArticlesEntity], daos: [ArticlesDao])
@singleton
class DemoDB extends _$DemoDB {

  DemoDB() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}