// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'to_do.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ToDoTearOff {
  const _$ToDoTearOff();

  _ToDo call(
      {required String id,
      required String title,
      required String details,
      required DateTime date}) {
    return _ToDo(
      id: id,
      title: title,
      details: details,
      date: date,
    );
  }
}

/// @nodoc
const $ToDo = _$ToDoTearOff();

/// @nodoc
mixin _$ToDo {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get details => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ToDoCopyWith<ToDo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToDoCopyWith<$Res> {
  factory $ToDoCopyWith(ToDo value, $Res Function(ToDo) then) =
      _$ToDoCopyWithImpl<$Res>;
  $Res call({String id, String title, String details, DateTime date});
}

/// @nodoc
class _$ToDoCopyWithImpl<$Res> implements $ToDoCopyWith<$Res> {
  _$ToDoCopyWithImpl(this._value, this._then);

  final ToDo _value;
  // ignore: unused_field
  final $Res Function(ToDo) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? details = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$ToDoCopyWith<$Res> implements $ToDoCopyWith<$Res> {
  factory _$ToDoCopyWith(_ToDo value, $Res Function(_ToDo) then) =
      __$ToDoCopyWithImpl<$Res>;
  @override
  $Res call({String id, String title, String details, DateTime date});
}

/// @nodoc
class __$ToDoCopyWithImpl<$Res> extends _$ToDoCopyWithImpl<$Res>
    implements _$ToDoCopyWith<$Res> {
  __$ToDoCopyWithImpl(_ToDo _value, $Res Function(_ToDo) _then)
      : super(_value, (v) => _then(v as _ToDo));

  @override
  _ToDo get _value => super._value as _ToDo;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? details = freezed,
    Object? date = freezed,
  }) {
    return _then(_ToDo(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      details: details == freezed
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_ToDo implements _ToDo {
  _$_ToDo(
      {required this.id,
      required this.title,
      required this.details,
      required this.date});

  @override
  final String id;
  @override
  final String title;
  @override
  final String details;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'ToDo(id: $id, title: $title, details: $details, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ToDo &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.details, details) ||
                const DeepCollectionEquality()
                    .equals(other.details, details)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(details) ^
      const DeepCollectionEquality().hash(date);

  @JsonKey(ignore: true)
  @override
  _$ToDoCopyWith<_ToDo> get copyWith =>
      __$ToDoCopyWithImpl<_ToDo>(this, _$identity);
}

abstract class _ToDo implements ToDo {
  factory _ToDo(
      {required String id,
      required String title,
      required String details,
      required DateTime date}) = _$_ToDo;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get details => throw _privateConstructorUsedError;
  @override
  DateTime get date => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ToDoCopyWith<_ToDo> get copyWith => throw _privateConstructorUsedError;
}
