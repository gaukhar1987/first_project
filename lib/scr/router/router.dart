import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/scr/router/routing_const.dart';
import 'package:flutter_application_1/scr/screens/MainScreen.dart';
import 'package:flutter_application_1/scr/screens/auth/auth_screen.dart';
import 'package:flutter_application_1/scr/screens/auth/bloc/log_in_bloc.dart';
import 'package:flutter_application_1/scr/screens/register/bloc/regis_bloc.dart';
import 'package:flutter_application_1/scr/screens/register/register_screen.dart';
import 'package:flutter_application_1/scr/screens/ribbon/ribbon_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route generateRoute (RouteSettings routeSettings){
    switch (routeSettings.name) {
      case AuthRoute:
        return CupertinoPageRoute (
          builder: (context) => BlocProvider(
            create: (context) => LogInBloc(),
            child: AuthScreen(),
          ),
        );
      case RegisterRoute:
        return CupertinoPageRoute (
          builder: (context) => BlocProvider(
            create: (context) => RegisBloc(),
            child:  RegisterSreen(),
          ),
        );
      case HomeRoute:
        return CupertinoPageRoute (
          builder: (context) => RibbonScreen(),
        );
      case MainRoute:
        return CupertinoPageRoute (
          builder: (context) => MainScreen(),
        );
      default:
        return CupertinoPageRoute (
          builder: (context) => AuthScreen(),
        );
    }
  }
}