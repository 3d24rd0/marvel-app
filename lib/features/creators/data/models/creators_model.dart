import 'dart:convert';
import 'package:marvel/features/creators/domain/entities/creators.dart';
import 'package:marvel/features/creators/domain/entities/image.dart';

import 'image_model.dart';

class CreatorsModel extends Creators {
  CreatorsModel({
    int id,
    String firstName,
    String middleName,
    String lastName,
    String suffix,
    String fullName,
    String modified,
    Image thumbnail,
  }) : super(
          id: id,
          firstName: firstName,
          middleName: middleName,
          lastName: lastName,
          suffix: suffix,
          fullName: fullName,
          modified: modified,
          thumbnail: thumbnail,
        );

  factory CreatorsModel.fromJson(String str) =>
      CreatorsModel.fromMap(json.decode(str));

  factory CreatorsModel.fromMap(Map<String, dynamic> json) => CreatorsModel(
        id: json["id"] == null ? null : json["id"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        middleName: json["middleName"] == null ? null : json["middleName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        suffix: json["suffix"] == null ? null : json["suffix"],
        fullName: json["fullName"] == null ? null : json["fullName"],
        modified: json["modified"] == null ? null : json["modified"],
        thumbnail: json["thumbnail"] == null
            ? null
            : ImageModel.fromMap(json["thumbnail"]),
      );
}
