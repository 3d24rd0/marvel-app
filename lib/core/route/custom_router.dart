import 'package:flutter/material.dart';
import 'package:marvel/features/creators/presentation/pages/creators_page.dart';
import 'package:marvel/features/series/presentation/pages/series_page.dart';

class CustomRouter {
  static const series = "/";
  static const creators = "/creators";

  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CustomRouter.series:
        return MaterialPageRoute(builder: (_) => SeriesPage());
        break;
      case CustomRouter.creators:
        return MaterialPageRoute(
            builder: (_) => CreatorsPage(
                  serieId: settings.arguments,
                ));
        break;
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
