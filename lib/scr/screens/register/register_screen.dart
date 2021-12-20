import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/scr/common/constants/color_constants.dart';
import 'package:flutter_application_1/scr/common/constants/padding_constants.dart';

class RegisterSreen extends StatelessWidget {
  const RegisterSreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      /*backgroundColor: Color(0xFFE5E5E5),*/
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
            CupertinoTextField(
              placeholder: 'Логин',
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
              decoration: BoxDecoration (
                color: CupertinoColors.white,
              ),
            ),
            Container(
              height: 1,
              color: Color(0xFFE0E6ED),
              margin: AppPadding.horizontal,
            ),
            CupertinoTextField(
              placeholder: 'Телефон',
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
              decoration: BoxDecoration(
                color: CupertinoColors.white,
              ),
            ),
            Container(
              height: 1,
              color: Color(0xFFE0E6ED),
              margin: AppPadding.horizontal,
            ),
            CupertinoTextField(
              placeholder: 'Почта',
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 19),
              decoration: BoxDecoration(
                color: CupertinoColors.white,
              ),
            ),
            Container(
              height: 1,
              color: Color(0xFFE0E6ED),
              margin: AppPadding.horizontal,
            ),
            CupertinoTextField(
              placeholder: 'Пароль',
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 19),
              decoration: BoxDecoration(
                color: CupertinoColors.white,
              ),
            ),
            Container(height: 220,),
            Padding(
              padding: AppPadding.horizontal,
              child: CupertinoButton(
              color: AppColors.main,
              child: Text('Создать аккаунт',
                    style: TextStyle(fontWeight: FontWeight.normal),
                    ),
            onPressed: () {}
            ),
            ),
          ],
        ),
      ), 
  );
  }
}