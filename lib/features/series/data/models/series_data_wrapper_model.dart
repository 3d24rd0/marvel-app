import 'dart:convert';

import 'package:marvel/features/series/domain/entities/series_data_container.dart';
import 'package:marvel/features/series/domain/entities/series_data_wrapper.dart';

import 'series_data_container_model.dart';

class SeriesDataWrapperModel extends SeriesDataWrapper {
  SeriesDataWrapperModel({
    int code,
    String status,
    String copyright,
    String attributionText,
    String attributionHtml,
    String etag,
    SeriesDataContainer data,
  }) : super(
          attributionHtml: attributionHtml,
          attributionText: attributionText,
          code: code,
          status: status,
          copyright: copyright,
          data: data,
          etag: etag,
        );

  factory SeriesDataWrapperModel.fromJson(String str) =>
      SeriesDataWrapperModel.fromMap(json.decode(str));

  factory SeriesDataWrapperModel.fromMap(Map<String, dynamic> json) =>
      SeriesDataWrapperModel(
        code: json["code"] == null ? null : json["code"],
        status: json["status"] == null ? null : json["status"],
        copyright: json["copyright"] == null ? null : json["copyright"],
        attributionText:
            json["attributionText"] == null ? null : json["attributionText"],
        attributionHtml:
            json["attributionHTML"] == null ? null : json["attributionHTML"],
        etag: json["etag"] == null ? null : json["etag"],
        data: json["data"] == null
            ? null
            : SeriesDataContainerModel.fromMap(json["data"]),
      );
}
