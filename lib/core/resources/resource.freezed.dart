// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'resource.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ResourceTearOff {
  const _$ResourceTearOff();

  _None<T> none<T>() {
    return _None<T>();
  }

  _Success<T> success<T>(T data) {
    return _Success<T>(
      data,
    );
  }

  _Progress<T> progress<T>({T? data}) {
    return _Progress<T>(
      data: data,
    );
  }

  _Fail<T> fail<T>(Exception exception, {T? data}) {
    return _Fail<T>(
      exception,
      data: data,
    );
  }
}

/// @nodoc
const $Resource = _$ResourceTearOff();

/// @nodoc
mixin _$Resource<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(T data) success,
    required TResult Function(T? data) progress,
    required TResult Function(Exception exception, T? data) fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(T data)? success,
    TResult Function(T? data)? progress,
    TResult Function(Exception exception, T? data)? fail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_None<T> value) none,
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Progress<T> value) progress,
    required TResult Function(_Fail<T> value) fail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_None<T> value)? none,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Progress<T> value)? progress,
    TResult Function(_Fail<T> value)? fail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResourceCopyWith<T, $Res> {
  factory $ResourceCopyWith(
          Resource<T> value, $Res Function(Resource<T>) then) =
      _$ResourceCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$ResourceCopyWithImpl<T, $Res> implements $ResourceCopyWith<T, $Res> {
  _$ResourceCopyWithImpl(this._value, this._then);

  final Resource<T> _value;
  // ignore: unused_field
  final $Res Function(Resource<T>) _then;
}

/// @nodoc
abstract class _$NoneCopyWith<T, $Res> {
  factory _$NoneCopyWith(_None<T> value, $Res Function(_None<T>) then) =
      __$NoneCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$NoneCopyWithImpl<T, $Res> extends _$ResourceCopyWithImpl<T, $Res>
    implements _$NoneCopyWith<T, $Res> {
  __$NoneCopyWithImpl(_None<T> _value, $Res Function(_None<T>) _then)
      : super(_value, (v) => _then(v as _None<T>));

  @override
  _None<T> get _value => super._value as _None<T>;
}

/// @nodoc

class _$_None<T> implements _None<T> {
  const _$_None();

  @override
  String toString() {
    return 'Resource<$T>.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _None<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(T data) success,
    required TResult Function(T? data) progress,
    required TResult Function(Exception exception, T? data) fail,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(T data)? success,
    TResult Function(T? data)? progress,
    TResult Function(Exception exception, T? data)? fail,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_None<T> value) none,
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Progress<T> value) progress,
    required TResult Function(_Fail<T> value) fail,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_None<T> value)? none,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Progress<T> value)? progress,
    TResult Function(_Fail<T> value)? fail,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class _None<T> implements Resource<T> {
  const factory _None() = _$_None<T>;
}

/// @nodoc
abstract class _$SuccessCopyWith<T, $Res> {
  factory _$SuccessCopyWith(
          _Success<T> value, $Res Function(_Success<T>) then) =
      __$SuccessCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class __$SuccessCopyWithImpl<T, $Res> extends _$ResourceCopyWithImpl<T, $Res>
    implements _$SuccessCopyWith<T, $Res> {
  __$SuccessCopyWithImpl(_Success<T> _value, $Res Function(_Success<T>) _then)
      : super(_value, (v) => _then(v as _Success<T>));

  @override
  _Success<T> get _value => super._value as _Success<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_Success<T>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_Success<T> implements _Success<T> {
  const _$_Success(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'Resource<$T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Success<T> &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$SuccessCopyWith<T, _Success<T>> get copyWith =>
      __$SuccessCopyWithImpl<T, _Success<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(T data) success,
    required TResult Function(T? data) progress,
    required TResult Function(Exception exception, T? data) fail,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(T data)? success,
    TResult Function(T? data)? progress,
    TResult Function(Exception exception, T? data)? fail,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_None<T> value) none,
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Progress<T> value) progress,
    required TResult Function(_Fail<T> value) fail,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_None<T> value)? none,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Progress<T> value)? progress,
    TResult Function(_Fail<T> value)? fail,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success<T> implements Resource<T> {
  const factory _Success(T data) = _$_Success<T>;

  T get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$SuccessCopyWith<T, _Success<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ProgressCopyWith<T, $Res> {
  factory _$ProgressCopyWith(
          _Progress<T> value, $Res Function(_Progress<T>) then) =
      __$ProgressCopyWithImpl<T, $Res>;
  $Res call({T? data});
}

/// @nodoc
class __$ProgressCopyWithImpl<T, $Res> extends _$ResourceCopyWithImpl<T, $Res>
    implements _$ProgressCopyWith<T, $Res> {
  __$ProgressCopyWithImpl(
      _Progress<T> _value, $Res Function(_Progress<T>) _then)
      : super(_value, (v) => _then(v as _Progress<T>));

  @override
  _Progress<T> get _value => super._value as _Progress<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_Progress<T>(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$_Progress<T> implements _Progress<T> {
  const _$_Progress({this.data});

  @override
  final T? data;

  @override
  String toString() {
    return 'Resource<$T>.progress(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Progress<T> &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$ProgressCopyWith<T, _Progress<T>> get copyWith =>
      __$ProgressCopyWithImpl<T, _Progress<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(T data) success,
    required TResult Function(T? data) progress,
    required TResult Function(Exception exception, T? data) fail,
  }) {
    return progress(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(T data)? success,
    TResult Function(T? data)? progress,
    TResult Function(Exception exception, T? data)? fail,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_None<T> value) none,
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Progress<T> value) progress,
    required TResult Function(_Fail<T> value) fail,
  }) {
    return progress(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_None<T> value)? none,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Progress<T> value)? progress,
    TResult Function(_Fail<T> value)? fail,
    required TResult orElse(),
  }) {
    if (progress != null) {
      return progress(this);
    }
    return orElse();
  }
}

abstract class _Progress<T> implements Resource<T> {
  const factory _Progress({T? data}) = _$_Progress<T>;

  T? get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ProgressCopyWith<T, _Progress<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FailCopyWith<T, $Res> {
  factory _$FailCopyWith(_Fail<T> value, $Res Function(_Fail<T>) then) =
      __$FailCopyWithImpl<T, $Res>;
  $Res call({Exception exception, T? data});
}

/// @nodoc
class __$FailCopyWithImpl<T, $Res> extends _$ResourceCopyWithImpl<T, $Res>
    implements _$FailCopyWith<T, $Res> {
  __$FailCopyWithImpl(_Fail<T> _value, $Res Function(_Fail<T>) _then)
      : super(_value, (v) => _then(v as _Fail<T>));

  @override
  _Fail<T> get _value => super._value as _Fail<T>;

  @override
  $Res call({
    Object? exception = freezed,
    Object? data = freezed,
  }) {
    return _then(_Fail<T>(
      exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$_Fail<T> implements _Fail<T> {
  const _$_Fail(this.exception, {this.data});

  @override
  final Exception exception;
  @override
  final T? data;

  @override
  String toString() {
    return 'Resource<$T>.fail(exception: $exception, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Fail<T> &&
            (identical(other.exception, exception) ||
                const DeepCollectionEquality()
                    .equals(other.exception, exception)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(exception) ^
      const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$FailCopyWith<T, _Fail<T>> get copyWith =>
      __$FailCopyWithImpl<T, _Fail<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() none,
    required TResult Function(T data) success,
    required TResult Function(T? data) progress,
    required TResult Function(Exception exception, T? data) fail,
  }) {
    return fail(exception, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? none,
    TResult Function(T data)? success,
    TResult Function(T? data)? progress,
    TResult Function(Exception exception, T? data)? fail,
    required TResult orElse(),
  }) {
    if (fail != null) {
      return fail(exception, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_None<T> value) none,
    required TResult Function(_Success<T> value) success,
    required TResult Function(_Progress<T> value) progress,
    required TResult Function(_Fail<T> value) fail,
  }) {
    return fail(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_None<T> value)? none,
    TResult Function(_Success<T> value)? success,
    TResult Function(_Progress<T> value)? progress,
    TResult Function(_Fail<T> value)? fail,
    required TResult orElse(),
  }) {
    if (fail != null) {
      return fail(this);
    }
    return orElse();
  }
}

abstract class _Fail<T> implements Resource<T> {
  const factory _Fail(Exception exception, {T? data}) = _$_Fail<T>;

  Exception get exception => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$FailCopyWith<T, _Fail<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
