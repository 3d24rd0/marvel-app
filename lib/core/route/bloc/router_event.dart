part of 'router_bloc.dart';

abstract class RouterEvent {
  Stream<RouterState> applyAsync(
      {RouterState currentState, RouterBloc bloc, NavigatorState navigatorKey});
}

class SeriesEvent extends RouterEvent {
  @override
  Stream<RouterState> applyAsync({
    RouterState currentState,
    RouterBloc bloc,
    NavigatorState navigatorKey,
  }) async* {
    navigatorKey.pushNamed(CustomRouter.series);
  }
}

class CreatorsEvent extends RouterEvent {
  final String serieId;

  CreatorsEvent(this.serieId);

  @override
  Stream<RouterState> applyAsync({
    RouterState currentState,
    RouterBloc bloc,
    NavigatorState navigatorKey,
  }) async* {
    navigatorKey.pushNamed(CustomRouter.creators, arguments: serieId);
  }
}

class SettingsEvent extends RouterEvent {
  @override
  Stream<RouterState> applyAsync({
    RouterState currentState,
    RouterBloc bloc,
    NavigatorState navigatorKey,
  }) async* {
    navigatorKey.pushNamed(CustomRouter.settings);
  }
}

class SupportEvent extends RouterEvent {
  @override
  Stream<RouterState> applyAsync({
    RouterState currentState,
    RouterBloc bloc,
    NavigatorState navigatorKey,
  }) async* {
    navigatorKey.pushNamed(CustomRouter.support);
  }
}

class GoBackOrNavigateEvent extends RouterEvent {
  final String route;

  GoBackOrNavigateEvent(this.route);

  @override
  Stream<RouterState> applyAsync(
      {RouterState currentState,
      RouterBloc bloc,
      NavigatorState navigatorKey}) async* {
    if (navigatorKey.canPop()) {
      navigatorKey.pop();
    } else {
      navigatorKey.pushNamed(route);
    }
  }
}
