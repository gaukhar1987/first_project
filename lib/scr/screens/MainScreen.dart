import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/scr/screens/auth/auth_screen.dart';
import 'package:flutter_application_1/scr/screens/register/register_screen.dart';
import 'package:flutter_application_1/scr/screens/ribbon/ribbon_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen ({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
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
                return AuthScreen();
              case 1:
                return RegisterSreen();
              case 2:
                return RibbonScreen();
              case 3:
                return RegisterSreen();
              default:
                return RegisterSreen();                
            }
          },
        );
      }
    );
  } 
}