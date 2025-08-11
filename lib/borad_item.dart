import 'package:flutter/material.dart';

class BoradItem extends StatelessWidget {
String text;
int index;
void Function(int) onPressed;
BoradItem({required this.text,required this.index ,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){onPressed(index);
      },
      child: Container(
        color: Colors.white,
        child:text.isEmpty?null:Image.asset('assets/images/$text.png'),
      ),
    );
  }
}