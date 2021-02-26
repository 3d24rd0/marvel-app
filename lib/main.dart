import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/core/route/bloc/router_bloc.dart';
import 'package:marvel/core/route/custom_router.dart';
import 'package:marvel/service_locator.dart';
import 'package:marvel/simple_bloc_observer.dart';
import 'package:marvel/theme.dart';

void main() async {
  await setUpLocator();
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel',
      theme: myTheme,
      navigatorKey: getIt<RouterBloc>().navigatorKey,
      initialRoute: CustomRouter.series,
      onGenerateRoute: (settings) => CustomRouter.generateRoute(settings),
    );
  }
}
