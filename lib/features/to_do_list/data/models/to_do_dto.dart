import 'package:freezed_annotation/freezed_annotation.dart';

part 'to_do_dto.g.dart';

@JsonSerializable()
class ToDoDto {
  final String id;
  final String title;
  final String details;
  final DateTime date;

  const ToDoDto(
      {required this.id,
      required this.title,
      required this.details,
      required this.date});

  factory ToDoDto.fromJson(Map<String, dynamic> json) => _$ToDoDtoFromJson(json);
}
