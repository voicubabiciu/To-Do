abstract class IDomainMapper<M, DomainModel> {
  DomainModel mapToDomainModel(M model);
  M mapFromDomainModel(DomainModel domainModel);
  List<DomainModel> mapToDomainModelList(List<M> modelList) {
    return <DomainModel>[];
  }

  List<M> mapFromDomainModelList(List<DomainModel> domainModelList) {
    return <M>[];
  }
}
