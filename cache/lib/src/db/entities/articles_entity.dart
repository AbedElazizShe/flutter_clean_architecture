import 'package:drift/drift.dart';

@DataClassName('Articles')
class ArticlesEntity extends Table {
  TextColumn get content => text()();

  TextColumn get type => text()();

  DateTimeColumn get updated => dateTime()();

  @override
  Set<Column> get primaryKey => {type};
}
