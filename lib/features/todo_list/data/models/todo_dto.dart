import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_dto.g.dart';

@JsonSerializable()
class TodoDto {
  TodoDto(
      {this.id,
      required this.title,
      required this.isChecked,
      required this.date});

  final String? id;
  final String title;
  final bool isChecked;
  final DateTime date;

  factory TodoDto.fromJson(Map<String, dynamic> json) =>
      _$TodoDtoFromJson(json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = _$TodoDtoToJson(this);
    json.remove('id');
    return json;
  }
}
