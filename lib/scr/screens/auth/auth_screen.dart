import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/scr/common/constants/color_constants.dart';
import 'package:flutter_application_1/scr/common/constants/padding_constants.dart';
import 'package:flutter_application_1/scr/router/routing_const.dart';
import 'package:flutter_application_1/scr/screens/MainScreen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: Border(),
        middle: Text('Авторизация'),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(),

            Container (
              height: 1,
              color: Color(0xFFE0E6ED),
              margin: AppPadding.horizontal,
            ),

            CupertinoTextField(
              placeholder: 'Пароль',
              decoration: BoxDecoration (
                color: CupertinoColors.white,
              ),
              padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
            ),
            SizedBox(height: 32),

            Padding(
              padding: AppPadding.horizontal,
              child: CupertinoButton(
                padding: const EdgeInsets.symmetric(vertical: 20),
                color: AppColors.main,
                child: Text('Войти',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ), 
                onPressed: (){
                  Navigator.push(
                    context, 
                    CupertinoPageRoute(
                       builder: (context) {
                          return MainScreen();
                      },
                    ),
                  );
               },
            ),
            ),

            SizedBox(height: 19),

            Padding (
              padding: AppPadding.horizontal,
              child: CupertinoButton(
                padding: const EdgeInsets.symmetric(vertical: 20),
                color: AppColors.main,
                child: Text('Зарегистрироваться',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                onPressed: (){
                  Navigator.pushNamed(
                    context,
                    RegisterRoute);
                    },
                  ),
              ),
            ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.placholder = 'Введите',
  }) : super(key: key);

  final String placholder;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      placeholder: placholder,
      decoration: BoxDecoration (
        color: CupertinoColors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
    );
  }
}