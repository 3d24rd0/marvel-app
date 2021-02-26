import 'dart:convert';
import 'package:marvel/features/creators/domain/entities/creators_data_wrapper.dart';

import 'creators_data_container_model.dart';

class CreatorsDataWrapperModel extends CreatorsDataWrapper {
  CreatorsDataWrapperModel({
    int code,
    String status,
    String copyright,
    String attributionText,
    String attributionHtml,
    String etag,
    CreatorsDataContainerModel data,
  }) : super(
          attributionHtml: attributionHtml,
          attributionText: attributionText,
          code: code,
          status: status,
          copyright: copyright,
          data: data,
          etag: etag,
        );

  factory CreatorsDataWrapperModel.fromJson(String str) =>
      CreatorsDataWrapperModel.fromMap(json.decode(str));

  factory CreatorsDataWrapperModel.fromMap(Map<String, dynamic> json) =>
      CreatorsDataWrapperModel(
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
            : CreatorsDataContainerModel.fromMap(json["data"]),
      );
}
