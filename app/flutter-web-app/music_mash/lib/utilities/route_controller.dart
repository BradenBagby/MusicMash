import 'package:flutter/material.dart';
import 'package:music_mash/widgets/routes/home.dart';

class RouteController {
  static final key = GlobalKey<NavigatorState>();
  static const initial = "/";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initial:
        return MaterialPageRoute(builder: (context) => Home());
      default:
        throw UnimplementedError();
    }
  }
}
