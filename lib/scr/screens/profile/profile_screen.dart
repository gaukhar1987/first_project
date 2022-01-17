import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget
{const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color(0xFFE5E5E5),
      navigationBar: CupertinoNavigationBar(middle: Text ('Профиль'),), 
      child: SafeArea(child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 38, width: 500,),
            Image.asset('./assets/images/profile_foto.png', height: 64, width: 64,),
            Text('Марипбек Чингиз', style: TextStyle( fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 12,),
            Text('maripbekoff@gmail.com', style: TextStyle( fontSize: 16, fontWeight: FontWeight.normal)),
            SizedBox(height: 27,),
            TextButton(
              onPressed:  () {},
              child: Text("Выйти", style: TextStyle(color: Colors.red, fontSize: 16)),),
          ],
        ),
      )
    );
  }
}