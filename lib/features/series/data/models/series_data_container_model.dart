import 'dart:convert';
import 'package:marvel/features/series/domain/entities/series.dart';
import 'package:marvel/features/series/domain/entities/series_data_container.dart';

import 'series_model.dart';

class SeriesDataContainerModel extends SeriesDataContainer {
  SeriesDataContainerModel({
    int offset,
    int limit,
    int total,
    int count,
    List<Series> results,
  }) : super(
          count: count,
          offset: offset,
          limit: limit,
          total: total,
          results: results,
        );

  factory SeriesDataContainerModel.fromJson(String str) =>
      SeriesDataContainerModel.fromMap(json.decode(str));

  factory SeriesDataContainerModel.fromMap(Map<String, dynamic> json) =>
      SeriesDataContainerModel(
        offset: json["offset"] == null ? null : json["offset"],
        limit: json["limit"] == null ? null : json["limit"],
        total: json["total"] == null ? null : json["total"],
        count: json["count"] == null ? null : json["count"],
        results: json["results"] == null
            ? null
            : List<Series>.from(
                json["results"].map((x) => SeriesModel.fromMap(x))),
      );
}
