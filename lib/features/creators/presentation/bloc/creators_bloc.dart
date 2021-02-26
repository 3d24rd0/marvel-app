import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:marvel/features/creators/domain/entities/creators.dart';
import 'package:marvel/features/creators/domain/usecases/get_creators_for_serie_usecase.dart';
import 'package:meta/meta.dart';
import 'dart:developer' as developer;
part 'creators_event.dart';
part 'creators_state.dart';

class CreatorsBloc extends Bloc<CreatorsEvent, CreatorsState> {
  final GetCreatorsForSerieUsecase getCreatorsForSerieUsecase;

  CreatorsBloc(this.getCreatorsForSerieUsecase) : super(UninitializedState());

  @override
  Stream<CreatorsState> mapEventToState(
    CreatorsEvent event,
  ) async* {
    try {
      yield* event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'CreatorsBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
