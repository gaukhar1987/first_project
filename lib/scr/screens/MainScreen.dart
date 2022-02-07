import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/scr/screens/auth/auth_screen.dart';
import 'package:flutter_application_1/scr/screens/profile/profile_screen.dart';
import 'package:flutter_application_1/scr/screens/register/register_screen.dart';
import 'package:flutter_application_1/scr/screens/ribbon/ribbon_screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/scr/screens/auth/bloc/log_in_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen ({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.gift)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.person)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.book)),
          ],
        ), 
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context){
              switch (index) {
                case 0:
                  return BlocProvider(
                  create: (context) => LogInBloc(),
                  child: AuthScreen(),
                  );
                case 1:
                  return RegisterSreen();
                case 2:
                  return RibbonScreen();
                case 3:
                  return ProfileScreen();
                default:
                  return RegisterSreen();                
              }
            },
          );
        }
      )
    );
  } 
}