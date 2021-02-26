import 'package:get_it/get_it.dart';
import 'core/route/bloc/router_bloc.dart';

GetIt getIt = GetIt.I;

Future<void> setUpLocator() async {
  // Features
  _core();
  _seriesFeature();
  _creatorsFeature();
}

void _core() {
  //rRouter
  getIt.registerSingleton(RouterBloc());
}
