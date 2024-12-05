import 'package:flutter/material.dart';

class CustomElevatedButtonWidget extends StatelessWidget{

  const CustomElevatedButtonWidget ({Key?key,required this.text, required this.onPressed, required this.textStyle, required this.style }) : super (key: key);

  final String text;
  final TextStyle textStyle;
  final Function()? onPressed;
  final ButtonStyle style;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){

      onPressed!();

    },
      style:style,
      child: Text(text , style: textStyle)
    );
  }
}
