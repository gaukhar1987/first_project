import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/scr/common/constants/color_constants.dart';
import 'package:flutter_application_1/scr/common/constants/padding_constants.dart';
import 'package:flutter_application_1/scr/common/models/tokens_model.dart';
import 'package:flutter_application_1/scr/router/routing_const.dart';
import 'package:flutter_application_1/scr/screens/auth/bloc/log_in_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            BlocConsumer<LogInBloc, LogInState>(
              listener: (context, state) {
                if (state is LogInLoading) {
                  Navigator.pushReplacementNamed(context, MainRoute);
                } else if (state is LogInFailed) {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text('Ошибка'),
                        content: Text(state.message ?? ''),
                        actions: [
                          CupertinoButton(
                            child: Text('ОК'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
                builder: (context, state) {
                  return CupertinoButton(
                    child: Text('Войти', style: TextStyle(fontWeight: FontWeight.bold),), 
                    onPressed: state is LogInLoading
                    ? null
                    :() {
                      context.read<LogInBloc>().add(
                        LogInPressed(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                    },
                  );
                },
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