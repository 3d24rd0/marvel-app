import 'package:meta/meta.dart';
import 'creators_data_container.dart';

class CreatorsDataWrapper {
  CreatorsDataWrapper({
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
  final CreatorsDataContainer data;
}
