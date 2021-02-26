import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:marvel/features/series/domain/entities/series.dart';
import 'package:marvel/features/series/domain/usecases/get_series_usecase.dart';
import 'package:meta/meta.dart';
import 'dart:developer' as developer;
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
