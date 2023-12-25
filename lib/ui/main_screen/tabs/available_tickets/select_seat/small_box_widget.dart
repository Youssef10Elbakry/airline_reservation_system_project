import 'package:flutter/material.dart';

class SmallBox extends StatelessWidget {
  Color color;
  SmallBox({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
      width: 30,
      height: 30,
    );
  }
}
