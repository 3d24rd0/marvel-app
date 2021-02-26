import 'package:dartz/dartz.dart';
import 'package:marvel/core/domain/entities/failures.dart';
import 'package:marvel/features/series/data/datasources/series_datasources.dart';
import 'package:marvel/features/series/domain/entities/series.dart';
import 'package:marvel/features/series/domain/repositories/series_repository.dart';

class SeriesRepositoryRemote implements SeriesRepository {
  final SeriesDataSource seriesDataSource;

  SeriesRepositoryRemote(this.seriesDataSource);

  @override
  Future<Either<Failure, List<Series>>> getSeries(int limit, int offset) async {
    try {
      final series = await seriesDataSource.series(limit, offset);
      return series.fold((l) {
        return Left(l);
      }, (r) {
        return Right(r.results);
      });
    } catch (err) {
      return Left(ServerFailure());
    }
  }
}
