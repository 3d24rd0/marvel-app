import 'package:meta/meta.dart';

class CreatorsItem {
    CreatorsItem({
        @required this.resourceUri,
        @required this.name,
        @required this.role,
    });

    final String resourceUri;
    final String name;
    final String role;
}