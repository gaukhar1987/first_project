import 'package:flutter/material.dart';

class RibbonScreen extends StatefulWidget {
  @override
  _RibbonScreenState createState() => _RibbonScreenState();
}

class _RibbonScreenState extends State<RibbonScreen> {
  List<Image> myimages = [
    Image.asset("assets/images/Esentail_Mall.png"),
    Image.asset("assets/images/Mega_Center.png"),
   ];
  List<String> text = [
   'Esentail Mall',
   'Mega Center',
 ];
   List<String> text2 = [
   'ул. Аль-Фараби',
   'ул. Розыбакиева',
 ];
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       
      body: 
       ListView.separated(
        itemBuilder: (BuildContext context, int index) { 
           return ListTile(
            leading: ConstrainedBox(
              constraints:
                BoxConstraints(maxWidth: 150, maxHeight: 343),
                child: Image.asset("assets/images/Esentail_Mall.png"),
            ),
            title: Text(text [index], style:  TextStyle (fontWeight: FontWeight.bold,fontSize: 16)),
            subtitle: Column(
              children: <Widget>[
                Row(children: <Widget>[
                  Text('Один из крупнейших торговых центров в ...', style:  TextStyle (fontWeight: FontWeight.normal,fontSize: 13)),
                ]
                ),
                Row(children: <Widget>[
                  Text(text2 [index], style:  TextStyle (fontWeight: FontWeight.normal,fontSize: 13)),
                ]
                )
              ]
            )
          );
        },
         separatorBuilder: (BuildContext context, int index)
        {
          return Divider(height: 20);
        }, 
        itemCount: 2,
      )
    );
  }
}