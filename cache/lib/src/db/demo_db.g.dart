// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'demo_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Articles extends DataClass implements Insertable<Articles> {
  final String content;
  final String type;
  final DateTime updated;
  Articles({required this.content, required this.type, required this.updated});
  factory Articles.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Articles(
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content'])!,
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type'])!,
      updated: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated'])!,
    );
  }
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
  const ArticlesEntityCompanion({
    this.content = const Value.absent(),
    this.type = const Value.absent(),
    this.updated = const Value.absent(),
  });
  ArticlesEntityCompanion.insert({
    required String content,
    required String type,
    required DateTime updated,
  })  : content = Value(content),
        type = Value(type),
        updated = Value(updated);
  static Insertable<Articles> custom({
    Expression<String>? content,
    Expression<String>? type,
    Expression<DateTime>? updated,
  }) {
    return RawValuesInsertable({
      if (content != null) 'content': content,
      if (type != null) 'type': type,
      if (updated != null) 'updated': updated,
    });
  }

  ArticlesEntityCompanion copyWith(
      {Value<String>? content, Value<String>? type, Value<DateTime>? updated}) {
    return ArticlesEntityCompanion(
      content: content ?? this.content,
      type: type ?? this.type,
      updated: updated ?? this.updated,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArticlesEntityCompanion(')
          ..write('content: $content, ')
          ..write('type: $type, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }
}

class $ArticlesEntityTable extends ArticlesEntity
    with TableInfo<$ArticlesEntityTable, Articles> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ArticlesEntityTable(this._db, [this._alias]);
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedColumn<String?> content = GeneratedColumn<String?>(
      'content', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String?> type = GeneratedColumn<String?>(
      'type', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _updatedMeta = const VerificationMeta('updated');
  @override
  late final GeneratedColumn<DateTime?> updated = GeneratedColumn<DateTime?>(
      'updated', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [content, type, updated];
  @override
  String get aliasedName => _alias ?? 'articles_entity';
  @override
  String get actualTableName => 'articles_entity';
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
    return Articles.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ArticlesEntityTable createAlias(String alias) {
    return $ArticlesEntityTable(_db, alias);
  }
}

abstract class _$DemoDB extends GeneratedDatabase {
  _$DemoDB(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ArticlesEntityTable articlesEntity = $ArticlesEntityTable(this);
  late final ArticlesDao articlesDao = ArticlesDao(this as DemoDB);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [articlesEntity];
}
