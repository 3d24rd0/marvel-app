part of 'creators_bloc.dart';


@immutable
abstract class CreatorsState {
  final List<Creators> creators;

  CreatorsState({
    @required this.creators,
  });

  copyWith({
    List<Creators> creators,
  });
}

class UninitializedState extends CreatorsState {
  UninitializedState()
      : super(
          creators: null,
        );

  UninitializedState.withData({
    @required List<Creators> creators,
  }) : super(
          creators: creators,
        );

  @override
  copyWith({
    List<Creators> creators,
  }) =>
      UninitializedState.withData(
        creators: creators ?? this.creators,
      );
}

class InitializedState extends CreatorsState {
  InitializedState({
    @required List<Creators> creators,
  }) : super(
          creators: creators,
        );

  @override
  copyWith({
    List<Creators> creators,
  }) =>
      InitializedState(
        creators: creators ?? this.creators,
      );
}
