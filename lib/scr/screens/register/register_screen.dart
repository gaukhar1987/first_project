import 'package:flutter/cupertino.dart';

class RegisterSreen extends StatelessWidget {
  const RegisterSreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xFFE5E5E5),
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
              margin: const EdgeInsets.symmetric(horizontal: 16),
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
              margin: const EdgeInsets.symmetric(horizontal: 16),
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
              margin: const EdgeInsets.symmetric(horizontal: 16),
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
              padding: const EdgeInsets.symmetric(horizontal:16),
              child: CupertinoButton(
              color: Color(0xFF4631D2),
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