part of 'series_bloc.dart';

@immutable
abstract class SeriesState {
  final List<Series> series;

  SeriesState({
    @required this.series,
  });

  copyWith({
    List<Series> series,
  });
}

class UninitializedState extends SeriesState {
  UninitializedState()
      : super(
          series: List.empty(growable: true),
        );

  UninitializedState.withData({
    @required List<Series> series,
  }) : super(
          series: series,
        );

  @override
  copyWith({
    List<Series> series,
  }) =>
      UninitializedState.withData(
        series: series ?? this.series,
      );
}

class InitializedState extends SeriesState {
  InitializedState({
    @required List<Series> series,
  }) : super(
          series: series,
        );

  @override
  copyWith({
    List<Series> series,
  }) =>
      InitializedState(
        series: series ?? this.series,
      );
}
