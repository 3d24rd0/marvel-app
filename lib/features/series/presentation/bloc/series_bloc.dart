import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:marvel/core/domain/entities/failures.dart';
import 'package:marvel/core/route/bloc/router_bloc.dart';
import 'package:marvel/features/series/domain/entities/series.dart';
import 'package:marvel/features/series/domain/usecases/get_series_usecase.dart';
import 'package:marvel/service_locator.dart';
import 'package:meta/meta.dart';
import 'dart:developer' as developer;

import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'series_event.dart';
part 'series_state.dart';

class SeriesBloc extends Bloc<SeriesEvent, SeriesState> {
  final GetSeriesUsecase getSeriesUsecase;
  SeriesBloc(this.getSeriesUsecase) : super(UninitializedState());

  @override
  Stream<SeriesState> mapEventToState(
    SeriesEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'SeriesBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
