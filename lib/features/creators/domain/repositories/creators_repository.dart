import 'package:dartz/dartz.dart';
import 'package:marvel/core/domain/entities/failures.dart';
import 'package:marvel/features/creators/domain/entities/creators.dart';

abstract class CreatorsRepository {
  Future<Either<Failure, List<Creators> >> getCreatorsForSerie(String serieId);
}