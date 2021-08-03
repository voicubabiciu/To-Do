import 'package:freezed_annotation/freezed_annotation.dart';
part 'to_do.freezed.dart';

@freezed
class ToDo with _$ToDo {
  factory ToDo({required String id, required String title, required String details, required DateTime date}) = _ToDo;
}