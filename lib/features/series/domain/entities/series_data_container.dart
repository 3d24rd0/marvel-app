import 'package:marvel/features/series/domain/entities/series.dart';
import 'package:meta/meta.dart';

class SeriesDataContainer {
    SeriesDataContainer({
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
    final List<Series> results;
}