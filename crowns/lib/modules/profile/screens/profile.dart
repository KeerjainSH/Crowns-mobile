import 'package:crowns/constants/request_enums.dart';
import 'package:crowns/modules/profile/providers/profile_provider.dart';
import 'package:crowns/widgets/app_widgets.dart';
import 'package:flutter/material.dart';

import 'package:crowns/constants/app_constants.dart';
import 'package:crowns/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);

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
                  Icons.person_outline,
                  size: 43,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    profileProvider.profile.nama,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    profileProvider.profile.username,
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

    return Provider(
      lazy: false,
      create: (context) => profileProvider.fetchProfile(),
      // create: (context) {
      //   Future<Map<String, dynamic>> result = profileProvider.logout();
      //   Navigator.pushNamedAndRemoveUntil(
      //       context, RouteConstants.login, (route) => false);
      // },
      dispose: (context, data) {},
      child: SafeArea(
        child: Scaffold(
          body: profileProvider.profileStatus == RequestStatus.Fetched
              ? SingleChildScrollView(
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
                          callback: () {
                            Future<Map<String, dynamic>> result =
                                profileProvider.logout();
                            result.then((value) =>
                                Navigator.pushNamedAndRemoveUntil(context,
                                    RouteConstants.login, (route) => false));
                          },
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  ),
                )
              : profileProvider.profileStatus == RequestStatus.Failed
                  ? Center(child: Text('Terjadi kesalahan'))
                  : Center(child: CircularProgressIndicator()),
          bottomNavigationBar: navbar,
        ),
      ),
    );
  }
}
