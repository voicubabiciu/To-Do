// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ToDoEntry extends DataClass implements Insertable<ToDoEntry> {
  final String id;
  final String title;
  final String details;
  final DateTime stamp;
  ToDoEntry(
      {required this.id,
      required this.title,
      required this.details,
      required this.stamp});
  factory ToDoEntry.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ToDoEntry(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      details: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}details'])!,
      stamp: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}stamp'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['details'] = Variable<String>(details);
    map['stamp'] = Variable<DateTime>(stamp);
    return map;
  }

  ToDoEntriesCompanion toCompanion(bool nullToAbsent) {
    return ToDoEntriesCompanion(
      id: Value(id),
      title: Value(title),
      details: Value(details),
      stamp: Value(stamp),
    );
  }

  factory ToDoEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ToDoEntry(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      details: serializer.fromJson<String>(json['details']),
      stamp: serializer.fromJson<DateTime>(json['stamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'details': serializer.toJson<String>(details),
      'stamp': serializer.toJson<DateTime>(stamp),
    };
  }

  ToDoEntry copyWith(
          {String? id, String? title, String? details, DateTime? stamp}) =>
      ToDoEntry(
        id: id ?? this.id,
        title: title ?? this.title,
        details: details ?? this.details,
        stamp: stamp ?? this.stamp,
      );
  @override
  String toString() {
    return (StringBuffer('ToDoEntry(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('details: $details, ')
          ..write('stamp: $stamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(title.hashCode, $mrjc(details.hashCode, stamp.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ToDoEntry &&
          other.id == this.id &&
          other.title == this.title &&
          other.details == this.details &&
          other.stamp == this.stamp);
}

class ToDoEntriesCompanion extends UpdateCompanion<ToDoEntry> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> details;
  final Value<DateTime> stamp;
  const ToDoEntriesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.details = const Value.absent(),
    this.stamp = const Value.absent(),
  });
  ToDoEntriesCompanion.insert({
    required String id,
    required String title,
    required String details,
    required DateTime stamp,
  })  : id = Value(id),
        title = Value(title),
        details = Value(details),
        stamp = Value(stamp);
  static Insertable<ToDoEntry> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? details,
    Expression<DateTime>? stamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (details != null) 'details': details,
      if (stamp != null) 'stamp': stamp,
    });
  }

  ToDoEntriesCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? details,
      Value<DateTime>? stamp}) {
    return ToDoEntriesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      details: details ?? this.details,
      stamp: stamp ?? this.stamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (details.present) {
      map['details'] = Variable<String>(details.value);
    }
    if (stamp.present) {
      map['stamp'] = Variable<DateTime>(stamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ToDoEntriesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('details: $details, ')
          ..write('stamp: $stamp')
          ..write(')'))
        .toString();
  }
}

class $ToDoEntriesTable extends ToDoEntries
    with TableInfo<$ToDoEntriesTable, ToDoEntry> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ToDoEntriesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _detailsMeta = const VerificationMeta('details');
  late final GeneratedColumn<String?> details = GeneratedColumn<String?>(
      'details', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _stampMeta = const VerificationMeta('stamp');
  late final GeneratedColumn<DateTime?> stamp = GeneratedColumn<DateTime?>(
      'stamp', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, details, stamp];
  @override
  String get aliasedName => _alias ?? 'to_do_entries';
  @override
  String get actualTableName => 'to_do_entries';
  @override
  VerificationContext validateIntegrity(Insertable<ToDoEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('details')) {
      context.handle(_detailsMeta,
          details.isAcceptableOrUnknown(data['details']!, _detailsMeta));
    } else if (isInserting) {
      context.missing(_detailsMeta);
    }
    if (data.containsKey('stamp')) {
      context.handle(
          _stampMeta, stamp.isAcceptableOrUnknown(data['stamp']!, _stampMeta));
    } else if (isInserting) {
      context.missing(_stampMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ToDoEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ToDoEntry.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ToDoEntriesTable createAlias(String alias) {
    return $ToDoEntriesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ToDoEntriesTable toDoEntries = $ToDoEntriesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [toDoEntries];
}
