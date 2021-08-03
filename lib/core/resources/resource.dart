import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'resource.freezed.dart';

@freezed
class Resource<T> with _$Resource<T> {
  const factory Resource.none() = _None<T>;

  const factory Resource.success(final T data) = _Success<T>;

  const factory Resource.progress({final T? data}) = _Progress<T>;

  const factory Resource.fail(
    final DioError exception, {
    final T? data,
  }) = _Fail<T>;
}

extension ResourceWrapper<T> on Resource<T> {
  Object? get data => when(
      none: () => null,
      success: (T data) => data,
      progress: (T? data) => data,
      fail: (DioError data, T? exception) => data);

  Resource<R> mapResource<TT, R>(Transform<T, R> transform) => when(
      none: () => Resource<R>.none(),
      success: (T data) => Resource<R>.success(transform(data)),
      progress: (T? data) =>
          Resource<R>.progress(data: data != null ? transform(data) : null),
      fail: (DioError exception, T? data) => Resource<R>.fail(exception,
          data: data != null ? transform(data) : null));
}

typedef Transform<T, R> = R Function(T data);
