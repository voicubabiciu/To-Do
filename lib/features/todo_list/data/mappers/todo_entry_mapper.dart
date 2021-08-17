import 'package:to_do/core/data/moor_database.dart';
import 'package:to_do/core/mappers/entry_mapper.dart';
import 'package:to_do/features/todo_list/domain/entities/todo.dart';

class ToDoEntryMapper extends IEntryMapper<TodoEntry, Todo> {
  @override
  TodoEntry mapFromDomainModel(Todo domainModel) {
    return TodoEntry(
      id: domainModel.id,
      title: domainModel.title,
      isChecked: domainModel.isChecked,
      stamp: domainModel.date,
    );
  }

  @override
  Todo mapToDomainModel(TodoEntry model) {
    return Todo(
      id: model.id,
      title: model.title,
      isChecked: model.isChecked,
      date: model.stamp,
    );
  }

  @override
  List<TodoEntry> mapFromDomainModelList(List<Todo> domainModelList) {
    return List<TodoEntry>.of(domainModelList.map(mapFromDomainModel));
  }

  @override
  List<Todo> mapToDomainModelList(List<TodoEntry> entries) {
    return List<Todo>.of(entries.map(mapToDomainModel));
  }
}
