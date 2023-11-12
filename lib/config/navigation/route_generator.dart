import 'package:flutter/material.dart';
import '../../modules/home/view/screens/home_view.dart';
import 'navigation.dart';

class RouteGenerator {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return platformPageRoute(const HomeView());
      default:
        return platformPageRoute(Container());
    }
  }
}
