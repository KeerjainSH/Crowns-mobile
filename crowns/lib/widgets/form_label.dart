import 'package:flutter/material.dart';

class FormLabel extends StatelessWidget {
  final String text;

  FormLabel(this.text);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
