import 'package:flutter/material.dart';
class BigBox extends StatefulWidget {
  String text;
  Color fontColor;
  Color borderColor;
  Color backColor;
  BigBox({super.key, required this.text, required this.backColor, required this.borderColor, required this.fontColor});

  @override
  State<BigBox> createState() => _BigBoxState();
}

class _BigBoxState extends State<BigBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: widget.backColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: widget.borderColor
        )
      ),
      width: 50,
      height: 50,
      child: Center(child: Text(widget.text, style: TextStyle(fontSize: 20, color: widget.fontColor),),)
    );
  }
}
