import 'package:marvel/features/series/domain/entities/series_data_container.dart';
import 'package:meta/meta.dart';

class SeriesDataWrapper {
    SeriesDataWrapper({
        @required this.code,
        @required this.status,
        @required this.copyright,
        @required this.attributionText,
        @required this.attributionHtml,
        @required this.etag,
        @required this.data,
    });

    final int code;
    final String status;
    final String copyright;
    final String attributionText;
    final String attributionHtml;
    final String etag;
    final SeriesDataContainer data;
}