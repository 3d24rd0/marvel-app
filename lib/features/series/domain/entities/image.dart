import 'package:meta/meta.dart';

class Image {
    Image({
        @required this.path,
        @required this.ext,
    });

    final String path;
    final String ext;

  String getUri() {return (path +"."+ ext).replaceAll("http://", "https://");}
}