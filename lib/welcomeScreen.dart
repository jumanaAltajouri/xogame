import 'package:flutter/material.dart';
import 'package:xogame/selcationsymbol.dart';

class Welcomescreen extends StatelessWidget {
static const String routeName='/welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors:[Color(0xff00D2FF), Color(0xff3A7BD5)],
    begin: Alignment.topCenter,
    end:Alignment.bottomCenter,)),
     child: SafeArea(
       child: Column(
            children: [
              Image.asset(
                'assets/images/tectac.png',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Spacer(),
              Text(
                'Pick who goes first?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 17),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16),
                child: Row(children: [
                           Selcationsymbol(symbol: 'X'),
                           SizedBox(width: 16,),
                           Selcationsymbol(symbol: 'O'),
                ],
                ),
              )
       ],),
     ),
      ) ,
    );
  }
}