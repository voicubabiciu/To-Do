import 'package:to_do/core/mappers/domain_mapper.dart';
import 'package:to_do/features/to_do_list/data/models/to_do_dto.dart';
import 'package:to_do/features/to_do_list/domain/entities/to_do.dart';

class ToDoDtoMapper extends IDomainMapper<ToDoDto, ToDo> {
  @override
  ToDoDto mapFromDomainModel(ToDo domainModel) {
    return ToDoDto(
      id: domainModel.id,
      title: domainModel.title,
      details: domainModel.details,
      date: domainModel.date,
    );
  }

  @override
  ToDo mapToDomainModel(ToDoDto model) {
    return ToDo(
      id: model.id,
      title: model.title,
      details: model.details,
      date: model.date,
    );
  }

  @override
  List<ToDoDto> mapFromDomainModelList(List<ToDo> domainModelList) {
    return List<ToDoDto>.of(domainModelList.map(mapFromDomainModel));
  }

  @override
  List<ToDo> mapToDomainModelList(List<ToDoDto> modelList) {
    return List<ToDo>.of(modelList.map(mapToDomainModel));
  }
}
