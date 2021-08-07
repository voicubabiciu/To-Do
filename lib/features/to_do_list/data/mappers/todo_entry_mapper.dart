import 'package:to_do/core/data/moor_database.dart';
import 'package:to_do/core/mappers/entry_mapper.dart';
import 'package:to_do/features/to_do_list/domain/entities/to_do.dart';

class ToDoEntryMapper extends IEntryMapper<ToDoEntry, ToDo> {
  @override
  ToDoEntry mapFromDomainModel(ToDo domainModel) {
    return ToDoEntry(
      id: domainModel.id,
      title: domainModel.title,
      details: domainModel.details,
      stamp: domainModel.date,
    );
  }

  @override
  ToDo mapToDomainModel(ToDoEntry model) {
    return ToDo(
      id: model.id,
      title: model.title,
      details: model.details,
      date: model.stamp,
    );
  }

  @override
  List<ToDoEntry> mapFromDomainModelList(List<ToDo> domainModelList) {
    return List<ToDoEntry>.of(domainModelList.map(mapFromDomainModel));
  }

  @override
  List<ToDo> mapToDomainModelList(List<ToDoEntry> entries) {
    return List<ToDo>.of(entries.map(mapToDomainModel));
  }
}
