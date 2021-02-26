import 'dart:convert';

import 'package:marvel/features/creators/domain/entities/image.dart';

class ImageModel extends Image {
  ImageModel({
    String path,
    String ext,
  }) : super(
          path: path,
          ext: ext,
        );

  factory ImageModel.fromJson(String str) =>
      ImageModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ImageModel.fromMap(Map<String, dynamic> json) => ImageModel(
        path: json["path"] == null ? null : json["path"],
        ext: json["extension"] == null ? null : json["extension"],
      );

  Map<String, dynamic> toMap() => {
        "path": path == null ? null : path,
        "extension": ext == null ? null : ext,
      };
}
