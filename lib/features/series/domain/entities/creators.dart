import 'package:meta/meta.dart';

import 'creators_item.dart';

class Creators {
    Creators({
        @required this.available,
        @required this.collectionUri,
        @required this.items,
        @required this.returned,
    });

    final int available;
    final String collectionUri;
    final List<CreatorsItem> items;
    final int returned;
}