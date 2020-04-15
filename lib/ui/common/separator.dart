import 'package:flutter/material.dart';

class Separator extends StatelessWidget {
  final int color;

  const Separator({this.color = 0xffffffff});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 4.0),
        height: 2.0,
        width: 18.0,
        color: Color(color) //0xFFFFFFFF
        );
  }
}
