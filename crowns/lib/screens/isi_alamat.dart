import 'package:flutter/material.dart';

import 'package:crowns/widgets/app_header.dart';

import 'package:crowns/utils/image_constants.dart';
import 'package:crowns/utils/color_constants.dart';

class IsiAlamatPage extends StatefulWidget {
  @override
  _IsiAlamatPageState createState() => _IsiAlamatPageState();
}

class _IsiAlamatPageState extends State<IsiAlamatPage> {
  int _state = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 41),
            AppHeader(),
            SizedBox(height: 36),

            /// Show image progress bar
            Container(
              width: 221,
              child: Image.asset(ImageConstants.progressBar3),
            ),
            SizedBox(height: 24),

            /// Button choice
            Center(
              child: Container(
                width: 227,
                child: FirstStateButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstStateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 145, height: 42),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontFamily: 'SFProDisplay'),
                primary: ColorConstants.backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(180.0),
                ),
              ),
              onPressed: () {},
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Antar Sendiri",
                  style: TextStyle(
                    color: ColorConstants.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(180.0),
              color: ColorConstants.primaryColor,
            ),
            width: 114,
            height: 42,
            child: Center(
              child: Text(
                "Di Ambil",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SecondStateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 145, height: 42),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(fontFamily: 'SFProDisplay'),
                primary: ColorConstants.backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(180.0),
                ),
              ),
              onPressed: () {},
              child: Text(
                "Di Ambil",
                style: TextStyle(
                  color: ColorConstants.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(180.0),
              color: ColorConstants.primaryColor,
            ),
            width: 114,
            height: 42,
            child: Center(
              child: Text(
                "Antar Sendiri",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
