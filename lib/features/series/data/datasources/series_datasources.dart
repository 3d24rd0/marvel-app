import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:marvel/core/domain/entities/failures.dart';
import 'package:marvel/features/series/data/models/series_data_wrapper_model.dart';
import 'package:marvel/features/series/domain/entities/series_data_container.dart';
import 'package:meta/meta.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:crypto/crypto.dart';

abstract class SeriesDataSource {
  Future<Either<Failure, SeriesDataContainer>> series(int limit, int offset);
}

class SeriesDataSourceLocal implements SeriesDataSource {
  final String productsPatch;

  SeriesDataSourceLocal(this.productsPatch);

  @override
  Future<Either<Failure, SeriesDataContainer>> series(
      int limit, int offset) async {
    try {
      final string = await rootBundle.loadString(productsPatch);

      final wrapper = SeriesDataWrapperModel.fromJson(string);

      return Right(wrapper.data);
    } catch (err) {
      return Left(ServerFailure());
    }
  }
}

class SeriesDataSourceMarvel implements SeriesDataSource {
  final String domainApi;
  final String seriesPath;
  final String public;
  final String private;

  SeriesDataSourceMarvel({
    @required this.domainApi,
    @required this.seriesPath,
    @required this.public,
    @required this.private,
  });

  Future<Response> _generateGetResponse(
      Map<String, String> query, String path) async {
    var uri = Uri.https(domainApi, path, query);

    // Map<String, String> headers = {
    //   HttpHeaders.contentTypeHeader: "application/json; charset=utf-8",
    //   HttpHeaders.acceptHeader: "application/json; charset=utf-8",
    // };
    final Response response = await get(uri);
    return response;
  }

  @override
  Future<Either<Failure, SeriesDataContainer>> series(
      int limit, int offset) async {
    final ts = DateTime.now().millisecondsSinceEpoch.toString();

    var bytes = utf8.encode(ts+private+public);

    Digest md5Result = md5.convert(bytes);

    Map<String, String> query = {
      "offset": offset.toString(),
      "limit": limit.toString(),
      "apikey": public,
      "ts": ts,
      "hash": md5Result.toString(),
    };
    try {
      final response = await _generateGetResponse(query, seriesPath);

      if (response.statusCode == 200) {
        SeriesDataWrapperModel wrapper =
            SeriesDataWrapperModel.fromJson(response.body);

        return Right(wrapper.data);
      }
      return Left(ServerFailure());
    } catch (err) {
      return Left(ServerFailure());
    }
  }
}
