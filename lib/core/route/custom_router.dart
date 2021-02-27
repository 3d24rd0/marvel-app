import 'package:flutter/material.dart';
import 'package:marvel/features/creators/presentation/pages/creators_page.dart';
import 'package:marvel/features/series/presentation/pages/series_page.dart';
import 'package:marvel/features/settings/presentation/pages/settings_page.dart';
import 'package:marvel/features/support/presentation/pages/support_page.dart';

class CustomRouter {
  static const series = "/";
  static const creators = "/creators";
  static const settings = "/settings";
  static const support = "/support";

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
      case CustomRouter.settings:
        return MaterialPageRoute(builder: (_) => SettingsPage());
        break;
      case CustomRouter.support:
        return MaterialPageRoute(builder: (_) => SupportPage());
        break;
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
