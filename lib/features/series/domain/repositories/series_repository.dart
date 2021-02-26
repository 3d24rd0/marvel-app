import 'package:dartz/dartz.dart';
import 'package:marvel/core/domain/entities/failures.dart';
import 'package:marvel/features/series/domain/entities/series.dart';

abstract class SeriesRepository {
  Future<Either<Failure, List<Series> >> getSeries(int limit, int offset);
}