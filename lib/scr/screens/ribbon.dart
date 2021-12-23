import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RibbonScreen extends StatefulWidget {
  @override
  _RibbonScreenState createState() => _RibbonScreenState();
}

class _RibbonScreenState extends State<RibbonScreen> {
  List<String> myimages = [
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
     return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: 
      ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        
        itemBuilder: (BuildContext context, int index) { 
           return GestureDetector(
             child: Container(
               color: Color(0xFFE5E5E5),
               height: 20,
            ),
          );   
        },      
        itemCount: 4,
        scrollDirection: Axis.vertical,
        separatorBuilder: (BuildContext context, int index)
          { return Column(
            children: [
              Image.asset(myimages[index],),
              SizedBox(height: 11,),
              Row(
                children: <Widget>[
                  Text(text[index], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                ],
              ),
              Row(
                children: <Widget>[
                  Text('Один из крупнейших торговых центров в ...', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(text2[index], style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),),
                ],
              ) 
            ],
          );
        }
      ),
    );
  }
}