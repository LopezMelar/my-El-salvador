import 'package:flutter/material.dart';
import '../screens/detail_screen.dart';
import '../screens/home_screen.dart';


class AppRoute {
  static const String homeRoute = '/';
  static const String detailRoute = '/detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) =>HomeScreen());
      case detailRoute:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (_) => DetailScreen(
          image: args['image'],
          title: args['title'],
          address: args['address'],
          hours: args['hours'],
          prices: args['prices'],
          description: args['description'],
          phone: args['phone'],
          email: args['email'],
        ));
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(body: Center(child: Text('No route found'))));
    }
  }
}
