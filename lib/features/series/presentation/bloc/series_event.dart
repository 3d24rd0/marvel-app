part of 'series_bloc.dart';

@immutable
abstract class SeriesEvent {
  Stream<SeriesState> applyAsync({SeriesState currentState, SeriesBloc bloc});
}

class LoadEvent extends SeriesEvent {
  @override
  Stream<SeriesState> applyAsync(
      {SeriesState currentState, SeriesBloc bloc}) async* {
    bloc.add(LoadSeries());

    Future.delayed(const Duration(seconds: 2), () {
      bloc.add(LoadDelayedEvent());
    });
  }
}

class LoadDelayedEvent extends SeriesEvent {
  @override
  Stream<SeriesState> applyAsync(
      {SeriesState currentState, SeriesBloc bloc}) async* {
    yield InitializedState(
      series: currentState.series,
    );
  }
}

class LoadSeries extends SeriesEvent {
  @override
  Stream<SeriesState> applyAsync(
      {SeriesState currentState, SeriesBloc bloc}) async* {
    final eSeries = await bloc.getSeriesUsecase(
      GetSeriesParams(limit: 20, offset: currentState.series.length ~/ 20),
    );
    eSeries.fold(
      (failure) => Future.delayed(Duration(seconds: 2), () {
        // bloc.add(LoadSeries());
      }),
      (series) => bloc.add(AddSeries(series)),
    );
  }
}

class AddSeries extends SeriesEvent {
  final List<Series> listSeries;

  AddSeries(this.listSeries);

  @override
  Stream<SeriesState> applyAsync({currentState, bloc}) async* {
    yield currentState.copyWith(
        series: currentState.series..addAll(listSeries));
  }
}

class GoToCreators extends SeriesEvent {
  final String serieId;

  GoToCreators(this.serieId);

  @override
  Stream<SeriesState> applyAsync({currentState, bloc}) async* {
    getIt<RouterBloc>().add(CreatorsEvent(serieId));
  }
}
