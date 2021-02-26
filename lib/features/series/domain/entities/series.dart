import 'package:meta/meta.dart';

import 'creators.dart';
import 'image.dart';

class Series {
  Series({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.resourceUri,
    @required this.startYear,
    @required this.endYear,
    @required this.rating,
    @required this.modified,
    @required this.thumbnail,
    @required this.creators,
  });

  final int id;
  final String title;
  final String description;
  final String resourceUri;
  // final List<String> urls;
  final int startYear;
  final int endYear;
  final String rating;
  final String modified;
  final Image thumbnail;

  // final Comics comics;
  // final Stories stories;
  // final Events events;
  //final Characters characters;
  final Creators creators;

  // final Next next;
  // final Previous previous;
}
