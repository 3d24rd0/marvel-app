import 'package:flutter/material.dart';
import 'package:marvel/core/domain/entities/usecase.dart';
import 'package:marvel/features/series/domain/entities/series.dart';
import 'package:marvel/features/series/domain/repositories/series_repository.dart';
import 'package:meta/meta.dart';

class GetSeriesUsecase implements UseCase<List<Series>, GetSeriesParams> {
  final SeriesRepository _repository;
  GetSeriesUsecase({@required SeriesRepository repository})
      : assert(repository != null),
        _repository = repository;

  @override
  call(param) async {
    return _repository.getSeries(param.limit, param.offset);
  }
}

class GetSeriesParams extends NoParams {
  final int limit;
  final int offset;

  GetSeriesParams({@required this.limit, @required this.offset});
}

class GetSeriesParamsTest extends GetSeriesParams {
  GetSeriesParamsTest() : super(limit: 1, offset: 1);
}
