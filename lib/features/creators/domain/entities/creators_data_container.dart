import 'package:meta/meta.dart';

import 'creators.dart';

class CreatorsDataContainer {
  CreatorsDataContainer({
    @required this.offset,
    @required this.limit,
    @required this.total,
    @required this.count,
    @required this.results,
  });

  final int offset;
  final int limit;
  final int total;
  final int count;
  final List<Creators> results;
}
