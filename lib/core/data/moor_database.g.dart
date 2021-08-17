// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class TodoEntry extends DataClass implements Insertable<TodoEntry> {
  final String? id;
  final String title;
  final bool isChecked;
  final DateTime stamp;
  TodoEntry(
      {this.id,
      required this.title,
      required this.isChecked,
      required this.stamp});
  factory TodoEntry.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return TodoEntry(
      id: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      isChecked: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_checked'])!,
      stamp: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}stamp'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<String?>(id);
    }
    map['title'] = Variable<String>(title);
    map['is_checked'] = Variable<bool>(isChecked);
    map['stamp'] = Variable<DateTime>(stamp);
    return map;
  }

  TodoEntriesCompanion toCompanion(bool nullToAbsent) {
    return TodoEntriesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title: Value(title),
      isChecked: Value(isChecked),
      stamp: Value(stamp),
    );
  }

  factory TodoEntry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return TodoEntry(
      id: serializer.fromJson<String?>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      isChecked: serializer.fromJson<bool>(json['isChecked']),
      stamp: serializer.fromJson<DateTime>(json['stamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String?>(id),
      'title': serializer.toJson<String>(title),
      'isChecked': serializer.toJson<bool>(isChecked),
      'stamp': serializer.toJson<DateTime>(stamp),
    };
  }

  TodoEntry copyWith(
          {String? id, String? title, bool? isChecked, DateTime? stamp}) =>
      TodoEntry(
        id: id ?? this.id,
        title: title ?? this.title,
        isChecked: isChecked ?? this.isChecked,
        stamp: stamp ?? this.stamp,
      );
  @override
  String toString() {
    return (StringBuffer('TodoEntry(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('isChecked: $isChecked, ')
          ..write('stamp: $stamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(title.hashCode, $mrjc(isChecked.hashCode, stamp.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoEntry &&
          other.id == this.id &&
          other.title == this.title &&
          other.isChecked == this.isChecked &&
          other.stamp == this.stamp);
}

class TodoEntriesCompanion extends UpdateCompanion<TodoEntry> {
  final Value<String?> id;
  final Value<String> title;
  final Value<bool> isChecked;
  final Value<DateTime> stamp;
  const TodoEntriesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.isChecked = const Value.absent(),
    this.stamp = const Value.absent(),
  });
  TodoEntriesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required bool isChecked,
    required DateTime stamp,
  })  : title = Value(title),
        isChecked = Value(isChecked),
        stamp = Value(stamp);
  static Insertable<TodoEntry> custom({
    Expression<String?>? id,
    Expression<String>? title,
    Expression<bool>? isChecked,
    Expression<DateTime>? stamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (isChecked != null) 'is_checked': isChecked,
      if (stamp != null) 'stamp': stamp,
    });
  }

  TodoEntriesCompanion copyWith(
      {Value<String?>? id,
      Value<String>? title,
      Value<bool>? isChecked,
      Value<DateTime>? stamp}) {
    return TodoEntriesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      isChecked: isChecked ?? this.isChecked,
      stamp: stamp ?? this.stamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String?>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (isChecked.present) {
      map['is_checked'] = Variable<bool>(isChecked.value);
    }
    if (stamp.present) {
      map['stamp'] = Variable<DateTime>(stamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoEntriesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('isChecked: $isChecked, ')
          ..write('stamp: $stamp')
          ..write(')'))
        .toString();
  }
}

class $TodoEntriesTable extends TodoEntries
    with TableInfo<$TodoEntriesTable, TodoEntry> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TodoEntriesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _isCheckedMeta = const VerificationMeta('isChecked');
  late final GeneratedColumn<bool?> isChecked = GeneratedColumn<bool?>(
      'is_checked', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_checked IN (0, 1))');
  final VerificationMeta _stampMeta = const VerificationMeta('stamp');
  late final GeneratedColumn<DateTime?> stamp = GeneratedColumn<DateTime?>(
      'stamp', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, title, isChecked, stamp];
  @override
  String get aliasedName => _alias ?? 'todo_entries';
  @override
  String get actualTableName => 'todo_entries';
  @override
  VerificationContext validateIntegrity(Insertable<TodoEntry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('is_checked')) {
      context.handle(_isCheckedMeta,
          isChecked.isAcceptableOrUnknown(data['is_checked']!, _isCheckedMeta));
    } else if (isInserting) {
      context.missing(_isCheckedMeta);
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
  TodoEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    return TodoEntry.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TodoEntriesTable createAlias(String alias) {
    return $TodoEntriesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TodoEntriesTable todoEntries = $TodoEntriesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [todoEntries];
}
