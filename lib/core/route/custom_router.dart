import 'package:flutter/material.dart';

class CustomRouter {
  static const series = "/";

  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CustomRouter.series:
        return MaterialPageRoute(builder: (_) => Container());
        break;
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
