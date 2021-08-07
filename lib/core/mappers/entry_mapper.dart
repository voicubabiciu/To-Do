abstract class IEntryMapper<Entry, DomainModel> {
  DomainModel mapToDomainModel(Entry model);

  Entry mapFromDomainModel(DomainModel domainModel);

  List<DomainModel> mapToDomainModelList(List<Entry> entries) {
    return <DomainModel>[];
  }

  List<Entry> mapFromDomainModelList(List<DomainModel> domainModelList) {
    return <Entry>[];
  }
}
