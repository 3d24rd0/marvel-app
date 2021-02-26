import 'dart:convert';

import 'package:marvel/features/series/domain/entities/creators_item.dart';

class CreatorsItemModel extends CreatorsItem {
  CreatorsItemModel({
    String resourceUri,
    String name,
    String role,
  }) : super(
          resourceUri: resourceUri,
          name: name,
          role: role,
        );

  factory CreatorsItemModel.fromJson(String str) =>
      CreatorsItemModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreatorsItemModel.fromMap(Map<String, dynamic> json) =>
      CreatorsItemModel(
        resourceUri: json["resourceURI"] == null ? null : json["resourceURI"],
        name: json["name"] == null ? null : json["name"],
        role: json["role"] == null ? null : json["role"],
      );

  Map<String, dynamic> toMap() => {
        "resourceURI": resourceUri == null ? null : resourceUri,
        "name": name == null ? null : name,
        "role": role == null ? null : role,
      };
}
