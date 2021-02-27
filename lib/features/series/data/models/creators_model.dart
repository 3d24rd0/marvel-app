import 'dart:convert';

import 'package:marvel/features/series/domain/entities/creators.dart';
import 'package:marvel/features/series/domain/entities/creators_item.dart';

import 'creators_item_model.dart';

class CreatorsModel extends Creators {
  CreatorsModel({
    int available,
    String collectionUri,
    List<CreatorsItem> items,
    int returned,
  }) : super(
          available: available,
          collectionUri: collectionUri,
          items: items,
          returned: returned,
        );

  factory CreatorsModel.fromJson(String str) =>
      CreatorsModel.fromMap(json.decode(str));

  factory CreatorsModel.fromMap(Map<String, dynamic> json) => CreatorsModel(
        available: json["available"] == null ? null : json["available"],
        collectionUri:
            json["collectionURI"] == null ? null : json["collectionURI"],
        items: json["items"] == null
            ? null
            : List<CreatorsItem>.from(
                json["items"].map((x) => CreatorsItemModel.fromMap(x))),
        returned: json["returned"] == null ? null : json["returned"],
      );
}
