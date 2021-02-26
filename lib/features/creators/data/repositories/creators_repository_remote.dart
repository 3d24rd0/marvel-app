import 'package:marvel/core/domain/entities/failures.dart';
import 'package:marvel/features/creators/data/datasources/creators_datasources.dart';
import 'package:dartz/dartz.dart';
import 'package:marvel/features/creators/domain/entities/creators.dart';
import 'package:marvel/features/creators/domain/repositories/creators_repository.dart';

class CreatorsRepositoryRemote implements CreatorsRepository {
  final CreatorsDataSource creatorsDataSource;

  CreatorsRepositoryRemote(this.creatorsDataSource);

  @override
  Future<Either<Failure, List<Creators>>> getCreatorsForSerie(String serieId) async {
    try {
      final series = await creatorsDataSource.creatorsBySerieId(serieId);
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
