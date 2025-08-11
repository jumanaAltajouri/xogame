import 'package:flutter/material.dart';
import 'package:xogame/XO_borrderScreen.dart';

class Selcationsymbol extends StatelessWidget {
String symbol;

Selcationsymbol({
  required this.symbol});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed(XoBorrderscreen.routeName,arguments: symbol);
          },
        child: Container(
         height: MediaQuery.sizeOf(context).height*0.2,
         padding: EdgeInsets.all(39),
          decoration: BoxDecoration(color: Colors.white,
            borderRadius: BorderRadius.circular(32)),
          child: Image.asset('assets/images/$symbol.png',fit: BoxFit.fill,),
        ),
      ),
    );
  }
}