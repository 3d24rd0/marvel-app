import 'package:flutter/material.dart';
import 'package:marvel/core/domain/entities/usecase.dart';
import 'package:marvel/features/creators/domain/entities/creators.dart';
import 'package:marvel/features/creators/domain/repositories/creators_repository.dart';
import 'package:meta/meta.dart';

class GetCreatorsForSerieUsecase
    implements UseCase<List<Creators>, GetCreatorsForSerieParams> {
  final CreatorsRepository _repository;
  GetCreatorsForSerieUsecase({@required CreatorsRepository repository})
      : assert(repository != null),
        _repository = repository;

  @override
  call(param) async {
    return _repository.getCreatorsForSerie(param.serieId);
  }
}

class GetCreatorsForSerieParams extends NoParams {
  final String serieId;

  GetCreatorsForSerieParams({@required this.serieId});
}
