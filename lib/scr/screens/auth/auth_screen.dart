import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/scr/common/constants/color_constants.dart';
import 'package:flutter_application_1/scr/common/constants/padding_constants.dart';
import 'package:flutter_application_1/scr/common/models/tokens_model.dart';
import 'package:flutter_application_1/scr/router/routing_const.dart';
import 'package:hive_flutter/adapters.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  Dio dio = Dio();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
            Container (
              color: Color(0xFFE0E6ED),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextField(
                    controller: emailController,
                    placeholder: 'Логин или почта',
                  ),
                  /*TextFieldDivider(),*/
                  CustomTextField(
                    controller: passwordController,
                    placeholder: 'Пароль',
                  ),
                ],
              ),
                  margin: AppPadding.horizontal,
            ),

            SizedBox(height: 32),

            Padding(
              padding: AppPadding.horizontal,
              child: CupertinoButton(
                padding: const EdgeInsets.symmetric(vertical: 20),
                color: AppColors.main,
                child: Text('Войти', style: TextStyle(fontWeight: FontWeight.bold),), 
                onPressed: () async {
                  
                  Box tokensBox = Hive.box('tokens');

                  try { 
                  Response response = await dio.post(
                    'http://api.codeunion.kz/api/v1/auth/login',
                    data: {
                    'email': emailController.text,
                    'password': passwordController.text});
                    
                    TokensModel tokensModel = TokensModel.fromJson(
                      response.data['tokens'],
                    );

                    print(tokensModel.access);
                    print(tokensModel.refresh);

                    tokensBox.put('access', tokensModel.access);
                    tokensBox.put('refresh', tokensModel.refresh);

                    Navigator.pushReplacementNamed(context, MainRoute);
                  }                  
                  on DioError catch (e) {
                    print(e.response!.data);
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: Text('Ошибка'),
                          content: Text('Неправильный логин или пароль!'),
                          actions: [
                            CupertinoButton(
                              child: Text('ОК'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        );
                      },
                    );
                    throw e;                    
                  }
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
    this.placeholder = 'Введите',
    this.suffix,
    this.controller,
  }) : super(key: key);

  final String placeholder;
  final Widget? suffix;
  // Создаём поле controller
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      placeholder: placeholder,
      decoration: BoxDecoration (
        color: CupertinoColors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
      suffix: suffix,
    );
  }
}