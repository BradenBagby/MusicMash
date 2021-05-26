import 'package:flutter/material.dart';
import 'package:music_mash/widgets/routes/home.dart';
import 'package:music_mash/widgets/routes/mashed.dart';

class RouteController {
  static final key = GlobalKey<NavigatorState>();
  static const initial = "/";
  static const mashed = '/mashed';

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initial:
        return MaterialPageRoute(builder: (context) => Home());
      case mashed:
        return MaterialPageRoute(builder: (context) => Mashed());
      default:
        throw UnimplementedError();
    }
  }
}
