import 'package:freezed_annotation/freezed_annotation.dart';
part 'todo.freezed.dart';

@freezed
class Todo with _$Todo {
  factory Todo(
      {String? id,
      required String title,
      @Default(false) bool isChecked,
      required DateTime date}) = _Todo;
}
