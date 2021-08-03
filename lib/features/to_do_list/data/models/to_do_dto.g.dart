// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_do_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ToDoDto _$ToDoDtoFromJson(Map<String, dynamic> json) {
  return ToDoDto(
    id: json['id'] as String,
    title: json['title'] as String,
    details: json['details'] as String,
    date: DateTime.parse(json['date'] as String),
  );
}

Map<String, dynamic> _$ToDoDtoToJson(ToDoDto instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'details': instance.details,
      'date': instance.date.toIso8601String(),
    };
