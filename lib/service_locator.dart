import 'package:get_it/get_it.dart';
import 'package:marvel/features/creators/data/datasources/creators_datasources.dart';
import 'package:marvel/features/creators/data/repositories/creators_repository_remote.dart';
import 'package:marvel/features/creators/domain/repositories/creators_repository.dart';
import 'package:marvel/features/creators/domain/usecases/get_creators_for_serie_usecase.dart';
import 'package:marvel/features/creators/presentation/bloc/creators_bloc.dart';
import 'package:marvel/features/series/data/datasources/series_datasources.dart';
import 'package:marvel/features/series/data/repositories/series_repository_remote.dart';
import 'package:marvel/features/series/domain/repositories/series_repository.dart';
import 'package:marvel/features/series/domain/usecases/get_series_usecase.dart';
import 'package:marvel/features/series/presentation/bloc/series_bloc.dart';
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

void _seriesFeature() {
  //Bloc
  getIt.registerFactory(
    () {
      return SeriesBloc(getIt());
    },
  );

  // // Use cases
  getIt.registerLazySingleton<GetSeriesUsecase>(
      () => GetSeriesUsecase(repository: getIt()));

  // Repository
  getIt.registerLazySingleton<SeriesRepository>(
    () => SeriesRepositoryRemote(
      getIt(),
    ),
  );

  // Data sources
  getIt.registerLazySingleton<SeriesDataSource>(
    () => SeriesDataSourceMarvel(
      domainApi: "gateway.marvel.com",
      seriesPath: "/v1/public/series",
      public: "5e98a3f3bced6bc7072135ba10c4a2d4",
      private: "1a9b6c52937e34486584f86f2eeea5181b7c5dab",
    ),
  );
}

void _creatorsFeature() {
  //Bloc
  getIt.registerFactory(
    () {
      return CreatorsBloc(getIt());
    },
  );

  // // Use cases
  getIt.registerLazySingleton<GetCreatorsForSerieUsecase>(
      () => GetCreatorsForSerieUsecase(repository: getIt()));

  // Repository
  getIt.registerLazySingleton<CreatorsRepository>(
    () => CreatorsRepositoryRemote(
      getIt(),
    ),
  );

  // Data sources
  getIt.registerLazySingleton<CreatorsDataSource>(
    () => CreatorsDataSourceMarvel(
      domainApi: "gateway.marvel.com",
      creatorsBySeriePath: "/v1/public/series/{seriesId}/creators",
      publicKey: "5e98a3f3bced6bc7072135ba10c4a2d4",
      privateKey: "1a9b6c52937e34486584f86f2eeea5181b7c5dab",
    ),
  );
}
