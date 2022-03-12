import 'package:flutter/material.dart';

class CustomCircular extends StatelessWidget {
  Color color;

  double? value;
  CustomCircular({Key? key, required this.color, this.value});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color,
      value: value,
    );
  }
}
