

import 'package:flutter/material.dart';
import 'package:xogame/XO_borrderScreen.dart';
import 'welcomeScreen.dart';
void main() {
  runApp( OXGame());
}

class OXGame extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {XoBorrderscreen.routeName: (_) => XoBorrderscreen(),
      Welcomescreen.routeName: (_) => Welcomescreen()
      },

      initialRoute:Welcomescreen.routeName,
    );
  }
}
