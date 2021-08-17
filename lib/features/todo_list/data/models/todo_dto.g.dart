// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoDto _$TodoDtoFromJson(Map<String, dynamic> json) {
  return TodoDto(
    id: json['id'] as String?,
    title: json['title'] as String,
    isChecked: json['isChecked'] as bool,
    date: DateTime.parse(json['date'] as String),
  );
}

Map<String, dynamic> _$TodoDtoToJson(TodoDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isChecked': instance.isChecked,
      'date': instance.date.toIso8601String(),
    };
