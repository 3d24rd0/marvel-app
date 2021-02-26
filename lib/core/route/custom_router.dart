import 'package:flutter/material.dart';
import 'package:marvel/features/series/presentation/pages/series_page.dart';

class CustomRouter {
  static const series = "/";

  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CustomRouter.series:
        return MaterialPageRoute(builder: (_) => SeriesPage());
        break;
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
