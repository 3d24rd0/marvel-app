import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:marvel/core/domain/entities/failures.dart';
import 'package:marvel/features/creators/data/models/creators_data_wrapper_model.dart';
import 'package:marvel/features/creators/domain/entities/creators_data_container.dart';
import 'package:meta/meta.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:crypto/crypto.dart';

abstract class CreatorsDataSource {
  Future<Either<Failure, CreatorsDataContainer>> creatorsBySerieId(
      String serieId);
}

class CreatorsDataSourceLocal implements CreatorsDataSource {
  final String productsPatch;

  CreatorsDataSourceLocal(this.productsPatch);

  @override
  creatorsBySerieId(serieId) async {
    try {
      final string = await rootBundle.loadString(productsPatch);

      final wrapper = CreatorsDataWrapperModel.fromJson(string);

      return Right(wrapper.data);
    } catch (err) {
      return Left(ServerFailure());
    }
  }
}

class CreatorsDataSourceMarvel implements CreatorsDataSource {
  final String domainApi;
  final String creatorsBySeriePath;
  final String publicKey;
  final String privateKey;

  CreatorsDataSourceMarvel({
    @required this.domainApi,
    @required this.creatorsBySeriePath,
    @required this.publicKey,
    @required this.privateKey,
  });

  Future<Response> _generateGetResponse(
      Map<String, String> query, String path) async {
    var uri = Uri.https(domainApi, path, query);
    final Response response = await get(uri);
    return response;
  }

  @override
  creatorsBySerieId(serieId) async {
    final ts = DateTime.now().millisecondsSinceEpoch.toString();

    var bytes = utf8.encode(ts + privateKey + publicKey);

    Digest md5Result = md5.convert(bytes);

    Map<String, String> query = {
      "contains": "hardcover",
      "orderBy": "title",
      "apikey": publicKey,
      "ts": ts,
      "hash": md5Result.toString()
    };

    try {
      final response = await _generateGetResponse(
          query, creatorsBySeriePath.replaceAll("{seriesId}", serieId));

      if (response.statusCode == 200) {
        CreatorsDataWrapperModel wrapper =
            CreatorsDataWrapperModel.fromJson(response.body);

        return Right(wrapper.data);
      }
      return Left(ServerFailure());
    } catch (err) {
      return Left(ServerFailure());
    }
  }
}
