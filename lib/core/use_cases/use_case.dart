abstract class IUseCase<P, R> {
  R dispatch(P param);
}

abstract class INoParamUseCase<R> {
  R dispatch();
}

abstract class ISimpleUseCase implements INoParamUseCase<void> {}

abstract class IFutureUseCase<P, R> {
  Future<R> dispatch(P param);
}

abstract class INoParamFutureUseCase<R> {
  Future<R> dispatch();
}

abstract class ISimpleFutureUseCase implements INoParamFutureUseCase<void> {}
