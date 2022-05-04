import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/scr/common/constants/color_constants.dart';
import 'package:flutter_application_1/scr/common/constants/padding_constants.dart';
import 'package:flutter_application_1/scr/router/routing_const.dart';
import 'package:flutter_application_1/scr/screens/auth/auth_screen.dart';
import 'package:flutter_application_1/scr/screens/register/bloc/regis_bloc.dart';
import 'package:provider/src/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RegisterSreen extends StatefulWidget {
  const RegisterSreen({Key? key}) : super(key: key);

  @override
  State<RegisterSreen> createState() => _RegisterSreenState();
}

class _RegisterSreenState extends State<RegisterSreen> {

    Dio dio = Dio();

  final TextEditingController nicknameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: Border(),
        middle: Text('Регистрация',
        style: TextStyle(fontWeight: FontWeight.normal),),
      ),
      child: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            SizedBox(height: 32,),

            CustomTextField(
              placeholder: 'Логин',
              controller: nicknameController,
            ),

            CustomTextField(
              placeholder: 'Телефон',
              controller: phoneController,
            ),

            CustomTextField(
              placeholder: 'Почта',
              controller: emailController,
            ),

            CustomTextField(
              placeholder: 'Пароль',
              controller: passwordController,
            ),
          
            Container(height: 220,),

              BlocConsumer<RegisBloc, RegisState>(
                listener: (context, state) {
                      if (state is Regisloaded) {
                        Navigator.pushReplacementNamed(context, AuthRoute);
                      } else if (state is RegisFailed) {
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
                    color: AppColors.main,
                    child: Text('Создать аккаунт',
                    style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    onPressed: state is RegisLoading
                    ? null
                    :() {
                      context.read<RegisBloc>().add(
                        RegisPressed(
                          email: emailController.text, 
                          nickname: nicknameController.text, 
                          phone: phoneController.text, 
                          password: passwordController.text
                            ),
                          );
                        },
                 );
               },
              )
          ],
        ),
      ), 
  );
  }
}