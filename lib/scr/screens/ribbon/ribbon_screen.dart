import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RibbonScreen extends StatefulWidget {
  @override
  _RibbonScreenState createState() => _RibbonScreenState();
}

class _RibbonScreenState extends State<RibbonScreen> {
  List<String> myImages = [
    './assets/images/Esentail.png',
    './assets/images/Mega.png',
    './assets/images/Dostyk.png',
   ];
  List<String> text = [
   'Esentail Mall',
   'Mega Center',
   'Dostyk Center',
  ];
   List<String> text2 = [
   'ул. Аль-Фараби',
   'ул. Розыбакиева',
   'ул. Абая',
  ];
  
  @override
  Widget build(BuildContext context) {
     return CupertinoPageScaffold(
      backgroundColor: Color(0xFFE5E5E5),
        child:
          ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>  Divider(height: 20, color: Color(0xFFE5E5E5),),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(color: const Color(0xFFFEFEFE),borderRadius: BorderRadius.circular(6),),
              width: 343.0,
              height: 234.0,
              margin: EdgeInsets.symmetric(horizontal: 20,),
              child:      
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6.0),
                      child: Image.asset(myImages[index],width: 343.0, height: 150.0,fit:BoxFit.fill,),),
                    SizedBox(height: 11,),
                    Text(text[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),textAlign: TextAlign.left,),
                    Text('Один из крупнейших торговых центров в ...', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),),
                    Text(text2[index], style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),),
                  ],
                ),
            );
          },      
          itemCount: myImages.length,
        ),
    );
  }
}