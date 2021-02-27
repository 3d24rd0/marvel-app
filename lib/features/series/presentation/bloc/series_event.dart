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
      GetSeriesParams(limit: 20, offset: 0),
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
    final series = currentState.series;
    series.addAll(listSeries);
    yield currentState.copyWith(series: series);
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

class RefreshSeriesEvent extends SeriesEvent {
  final RefreshController controller;

  RefreshSeriesEvent(this.controller);

  @override
  Stream<SeriesState> applyAsync({currentState, bloc}) async* {
    yield currentState.copyWith(series: List.empty());
    final eSeries = await bloc.getSeriesUsecase(
      GetSeriesParams(limit: 20, offset: 0),
    );

    var series = eSeries.fold(
      (failure) {
        controller.refreshFailed();
        return currentState.series;
      },
      (series) {
        controller.refreshCompleted();
        return series;
      },
    );
    yield currentState.copyWith(series: series);
  }
}

class LoadSeriesEvent extends SeriesEvent {
  final RefreshController controller;

  LoadSeriesEvent(this.controller);

  @override
  Stream<SeriesState> applyAsync({currentState, bloc}) async* {
    final offset = currentState.series.length;// ~/ 20;

    final eSeries = await bloc.getSeriesUsecase(
      GetSeriesParams(limit: 20, offset: offset),
    ).timeout(Duration(seconds: 10),onTimeout: () => Left(Timeout()),);

    var series = eSeries.fold(
      (failure) {
        controller.loadFailed();
        return currentState.series;
      },
      (series) {
        controller.loadComplete();
        return currentState.series..addAll(series);
      },
    );
    yield currentState.copyWith(series: series);
  }
}
