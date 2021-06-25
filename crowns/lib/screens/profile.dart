import 'package:crowns/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:crowns/utils/constants.dart';
import 'package:crowns/widgets/custom_button.dart';
import 'package:crowns/widgets/floating_bottom_navigation_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;

    Container buildProfileHeader() {
      return Container(
        height: 290,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 145,
                width: double.infinity,
                color: ColorConstants.primaryColor,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 145,
                width: double.infinity,
                color: Colors.white,
              ),
            ),
            Center(
              child: Container(
                height: 136,
                width: 136,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(360),
                  border: Border.all(
                    color: ColorConstants.darkGrey,
                    width: 1,
                  ),
                ),
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 43,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Michael Ricky',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Mendaftar sejak 4 Juli 2021',
                    style: TextStyle(
                      fontSize: 12,
                      color: ColorConstants.darkGrey,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            )
          ],
        ),
      );
    }

    final lineSeparator = Container(
      height: 1,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      color: ColorConstants.darkGrey,
    );

    final aturProfile = InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouteConstants.editProfile);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1,
              color: ColorConstants.darkGrey,
            ),
            bottom: BorderSide(
              width: 1,
              color: ColorConstants.darkGrey,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        width: MediaQuery.of(context).size.width * 0.87,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Atur Profil',
            style: TextStyle(
              color: ColorConstants.darkGrey,
            ),
          ),
        ),
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height -
                padding.top -
                padding.bottom,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildProfileHeader(),
                aturProfile,
                SizedBox(height: 20),
                CustomButton(
                  text: 'logout',
                  callback: () =>
                      Navigator.pushNamed(context, RouteConstants.profile),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
        bottomNavigationBar: navbar,
      ),
    );
  }
}
