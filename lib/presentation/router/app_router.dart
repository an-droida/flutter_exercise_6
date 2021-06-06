import 'package:flutter/material.dart';
import 'package:untitled/data/models/results.dart';
import 'package:untitled/presentation/screens/details_screen.dart';
import 'package:untitled/presentation/screens/home_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == "/") {
      return MaterialPageRoute(builder: (_) => HomeScreen());
    } else if (settings.name == '/details-screen') {
      var results = settings.arguments as Results;
      return MaterialPageRoute(builder: (_) => DetailsScreen(movie: results));
    } else {
      return null;
    }
  }
}
