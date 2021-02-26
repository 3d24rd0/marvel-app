import 'package:meta/meta.dart';

import 'image.dart';

class Creators {
  Creators({
    @required this.id,
    @required this.firstName,
    @required this.middleName,
    @required this.lastName,
    @required this.suffix,
    @required this.fullName,
    @required this.modified,
    @required this.thumbnail,
  });

  final int id;
  final String firstName;
  final String middleName;
  final String lastName;
  final String suffix;
  final String fullName;
  final String modified;
  final Image thumbnail;
}
