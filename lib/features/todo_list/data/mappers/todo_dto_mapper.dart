import 'package:to_do/core/mappers/domain_mapper.dart';
import 'package:to_do/features/todo_list/data/models/todo_dto.dart';
import 'package:to_do/features/todo_list/domain/entities/todo.dart';

class ToDoDtoMapper extends IDomainMapper<TodoDto, Todo> {
  @override
  TodoDto mapFromDomainModel(Todo domainModel) {
    return TodoDto(
      id: domainModel.id,
      title: domainModel.title,
      isChecked: domainModel.isChecked,
      date: domainModel.date,
    );
  }

  @override
  Todo mapToDomainModel(TodoDto model) {
    return Todo(
      id: model.id,
      title: model.title,
      isChecked: model.isChecked,
      date: model.date,
    );
  }

  @override
  List<TodoDto> mapFromDomainModelList(List<Todo> domainModelList) {
    return List<TodoDto>.of(domainModelList.map(mapFromDomainModel));
  }

  @override
  List<Todo> mapToDomainModelList(List<TodoDto> modelList) {
    return List<Todo>.of(modelList.map(mapToDomainModel));
  }
}
