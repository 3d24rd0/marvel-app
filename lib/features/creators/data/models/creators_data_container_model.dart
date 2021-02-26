import 'dart:convert';
import 'package:marvel/features/creators/domain/entities/creators.dart';
import 'package:marvel/features/creators/domain/entities/creators_data_container.dart';

import 'creators_model.dart';

class CreatorsDataContainerModel extends CreatorsDataContainer {
  CreatorsDataContainerModel({
    int offset,
    int limit,
    int total,
    int count,
    List<Creators> results,
  }) : super(
          count: count,
          offset: offset,
          limit: limit,
          total: total,
          results: results,
        );

  factory CreatorsDataContainerModel.fromJson(String str) =>
      CreatorsDataContainerModel.fromMap(json.decode(str));

  factory CreatorsDataContainerModel.fromMap(Map<String, dynamic> json) =>
      CreatorsDataContainerModel(
        offset: json["offset"] == null ? null : json["offset"],
        limit: json["limit"] == null ? null : json["limit"],
        total: json["total"] == null ? null : json["total"],
        count: json["count"] == null ? null : json["count"],
        results: json["results"] == null
            ? null
            : List<Creators>.from(
                json["results"].map((x) => CreatorsModel.fromMap(x))),
      );
}
