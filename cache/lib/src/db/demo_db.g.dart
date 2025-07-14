// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demo_db.dart';

// ignore_for_file: type=lint
class $ArticlesEntityTable extends ArticlesEntity
    with TableInfo<$ArticlesEntityTable, Articles> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArticlesEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _updatedMeta =
      const VerificationMeta('updated');
  @override
  late final GeneratedColumn<DateTime> updated = GeneratedColumn<DateTime>(
      'updated', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [content, type, updated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'articles_entity';
  @override
  VerificationContext validateIntegrity(Insertable<Articles> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {type};
  @override
  Articles map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Articles(
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      updated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated'])!,
    );
  }

  @override
  $ArticlesEntityTable createAlias(String alias) {
    return $ArticlesEntityTable(attachedDatabase, alias);
  }
}

class Articles extends DataClass implements Insertable<Articles> {
  final String content;
  final String type;
  final DateTime updated;
  const Articles(
      {required this.content, required this.type, required this.updated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['content'] = Variable<String>(content);
    map['type'] = Variable<String>(type);
    map['updated'] = Variable<DateTime>(updated);
    return map;
  }

  ArticlesEntityCompanion toCompanion(bool nullToAbsent) {
    return ArticlesEntityCompanion(
      content: Value(content),
      type: Value(type),
      updated: Value(updated),
    );
  }

  factory Articles.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Articles(
      content: serializer.fromJson<String>(json['content']),
      type: serializer.fromJson<String>(json['type']),
      updated: serializer.fromJson<DateTime>(json['updated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'content': serializer.toJson<String>(content),
      'type': serializer.toJson<String>(type),
      'updated': serializer.toJson<DateTime>(updated),
    };
  }

  Articles copyWith({String? content, String? type, DateTime? updated}) =>
      Articles(
        content: content ?? this.content,
        type: type ?? this.type,
        updated: updated ?? this.updated,
      );
  Articles copyWithCompanion(ArticlesEntityCompanion data) {
    return Articles(
      content: data.content.present ? data.content.value : this.content,
      type: data.type.present ? data.type.value : this.type,
      updated: data.updated.present ? data.updated.value : this.updated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Articles(')
          ..write('content: $content, ')
          ..write('type: $type, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(content, type, updated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Articles &&
          other.content == this.content &&
          other.type == this.type &&
          other.updated == this.updated);
}

class ArticlesEntityCompanion extends UpdateCompanion<Articles> {
  final Value<String> content;
  final Value<String> type;
  final Value<DateTime> updated;
  final Value<int> rowid;
  const ArticlesEntityCompanion({
    this.content = const Value.absent(),
    this.type = const Value.absent(),
    this.updated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ArticlesEntityCompanion.insert({
    required String content,
    required String type,
    required DateTime updated,
    this.rowid = const Value.absent(),
  })  : content = Value(content),
        type = Value(type),
        updated = Value(updated);
  static Insertable<Articles> custom({
    Expression<String>? content,
    Expression<String>? type,
    Expression<DateTime>? updated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (content != null) 'content': content,
      if (type != null) 'type': type,
      if (updated != null) 'updated': updated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ArticlesEntityCompanion copyWith(
      {Value<String>? content,
      Value<String>? type,
      Value<DateTime>? updated,
      Value<int>? rowid}) {
    return ArticlesEntityCompanion(
      content: content ?? this.content,
      type: type ?? this.type,
      updated: updated ?? this.updated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (updated.present) {
      map['updated'] = Variable<DateTime>(updated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArticlesEntityCompanion(')
          ..write('content: $content, ')
          ..write('type: $type, ')
          ..write('updated: $updated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$DemoDB extends GeneratedDatabase {
  _$DemoDB(QueryExecutor e) : super(e);
  $DemoDBManager get managers => $DemoDBManager(this);
  late final $ArticlesEntityTable articlesEntity = $ArticlesEntityTable(this);
  late final ArticlesDao articlesDao = ArticlesDao(this as DemoDB);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [articlesEntity];
}

typedef $$ArticlesEntityTableCreateCompanionBuilder = ArticlesEntityCompanion
    Function({
  required String content,
  required String type,
  required DateTime updated,
  Value<int> rowid,
});
typedef $$ArticlesEntityTableUpdateCompanionBuilder = ArticlesEntityCompanion
    Function({
  Value<String> content,
  Value<String> type,
  Value<DateTime> updated,
  Value<int> rowid,
});

class $$ArticlesEntityTableFilterComposer
    extends Composer<_$DemoDB, $ArticlesEntityTable> {
  $$ArticlesEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updated => $composableBuilder(
      column: $table.updated, builder: (column) => ColumnFilters(column));
}

class $$ArticlesEntityTableOrderingComposer
    extends Composer<_$DemoDB, $ArticlesEntityTable> {
  $$ArticlesEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updated => $composableBuilder(
      column: $table.updated, builder: (column) => ColumnOrderings(column));
}

class $$ArticlesEntityTableAnnotationComposer
    extends Composer<_$DemoDB, $ArticlesEntityTable> {
  $$ArticlesEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<DateTime> get updated =>
      $composableBuilder(column: $table.updated, builder: (column) => column);
}

class $$ArticlesEntityTableTableManager extends RootTableManager<
    _$DemoDB,
    $ArticlesEntityTable,
    Articles,
    $$ArticlesEntityTableFilterComposer,
    $$ArticlesEntityTableOrderingComposer,
    $$ArticlesEntityTableAnnotationComposer,
    $$ArticlesEntityTableCreateCompanionBuilder,
    $$ArticlesEntityTableUpdateCompanionBuilder,
    (Articles, BaseReferences<_$DemoDB, $ArticlesEntityTable, Articles>),
    Articles,
    PrefetchHooks Function()> {
  $$ArticlesEntityTableTableManager(_$DemoDB db, $ArticlesEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ArticlesEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ArticlesEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ArticlesEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> content = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<DateTime> updated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ArticlesEntityCompanion(
            content: content,
            type: type,
            updated: updated,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String content,
            required String type,
            required DateTime updated,
            Value<int> rowid = const Value.absent(),
          }) =>
              ArticlesEntityCompanion.insert(
            content: content,
            type: type,
            updated: updated,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ArticlesEntityTableProcessedTableManager = ProcessedTableManager<
    _$DemoDB,
    $ArticlesEntityTable,
    Articles,
    $$ArticlesEntityTableFilterComposer,
    $$ArticlesEntityTableOrderingComposer,
    $$ArticlesEntityTableAnnotationComposer,
    $$ArticlesEntityTableCreateCompanionBuilder,
    $$ArticlesEntityTableUpdateCompanionBuilder,
    (Articles, BaseReferences<_$DemoDB, $ArticlesEntityTable, Articles>),
    Articles,
    PrefetchHooks Function()>;

class $DemoDBManager {
  final _$DemoDB _db;
  $DemoDBManager(this._db);
  $$ArticlesEntityTableTableManager get articlesEntity =>
      $$ArticlesEntityTableTableManager(_db, _db.articlesEntity);
}
