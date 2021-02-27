part of 'creators_bloc.dart';

@immutable
abstract class CreatorsEvent {
  Stream<CreatorsState> applyAsync(
      {CreatorsState currentState, CreatorsBloc bloc});
}

class LoadEvent extends CreatorsEvent {
  final String serieId;

  LoadEvent(this.serieId);

  @override
  Stream<CreatorsState> applyAsync(
      {CreatorsState currentState, CreatorsBloc bloc}) async* {
    final eCreators = await bloc.getCreatorsForSerieUsecase(
      GetCreatorsForSerieParams(serieId: serieId),
    );
    final creators = eCreators.getOrElse(() => List.empty());
    yield InitializedState(creators: creators);
  }
}
