import 'dart:convert';

import 'package:marvel/features/series/data/models/creators_model.dart';
import 'package:marvel/features/series/domain/entities/creators.dart';
import 'package:marvel/features/series/domain/entities/series.dart';

import 'image_model.dart';

class SeriesModel extends Series {
  SeriesModel({
    int id,
    String title,
    String description,
    String resourceUri,
    int startYear,
    int endYear,
    String rating,
    String modified,
    ImageModel thumbnail,
    Creators creators,
  }) : super(
          id: id,
          title: title,
          description: description,
          resourceUri: resourceUri,
          startYear: startYear,
          endYear: endYear,
          rating: rating,
          modified: modified,
          thumbnail: thumbnail,
          creators: creators,
        );

  factory SeriesModel.fromJson(String str) =>
      SeriesModel.fromMap(json.decode(str));

  factory SeriesModel.fromMap(Map<String, dynamic> json) => SeriesModel(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        resourceUri: json["resourceURI"] == null ? null : json["resourceURI"],
        startYear: json["startYear"] == null ? null : json["startYear"],
        endYear: json["endYear"] == null ? null : json["endYear"],
        rating: json["rating"] == null ? null : json["rating"],
        // type: json["type"] == null ? null : json["type"],
        modified: json["modified"] == null ? null : json["modified"],
        thumbnail: json["thumbnail"] == null
            ? null
            : ImageModel.fromMap(json["thumbnail"]),
        creators: json["creators"] == null
            ? null
            : CreatorsModel.fromMap(json["creators"]),
      );
}
