import 'package:flutter/material.dart';

import 'package:crowns/constants/app_constants.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function() callback;

  CustomButton({required this.text, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: 125,
          height: 40,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: ColorConstants.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(180.0),
            ),
          ),
          onPressed: callback,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
