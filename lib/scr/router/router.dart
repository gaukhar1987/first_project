import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/scr/router/routing_const.dart';
import 'package:flutter_application_1/scr/screens/auth/auth_screen.dart';
import 'package:flutter_application_1/scr/screens/register/register_screen.dart';

class AppRouter {
  static Route generateRoute (RouteSettings routeSettings){
    switch (routeSettings.name) {
      case AuthRoute:
        return CupertinoPageRoute (
          builder: (context) => AuthScreen(),
        );
      case RegisterRoute:
        return CupertinoPageRoute (
          builder: (context) => RegisterSreen(),
        );
      default:
        return CupertinoPageRoute (
          builder: (context) => AuthScreen(),
        );
    }
  }
}