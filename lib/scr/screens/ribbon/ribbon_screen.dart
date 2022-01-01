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
        separatorBuilder: (BuildContext context, int index)
          { return GestureDetector(
             child: Container(
               color: Color(0xFFE5E5E5),
               height: 20,
            ),
          ); 
        },
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        itemBuilder: (BuildContext context, int index) {
           return Column(
            children: [
              Image.asset(myImages[index],),
              SizedBox(height: 11,),
              Text(text[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
              Text('Один из крупнейших торговых центров в ...', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),),
              Text(text2[index], style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),),
            ],
          );
        },      
        itemCount: myImages.length,
      ),
    );
  }
}