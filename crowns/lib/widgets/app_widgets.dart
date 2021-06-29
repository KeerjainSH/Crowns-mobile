import 'package:crowns/constants/app_constants.dart';

import 'package:flutter/material.dart';

import 'floating_bottom_navigation_bar.dart';

Container appHeader = Container(
  padding: EdgeInsets.only(left: appPadding),
  width: double.infinity,
  child: Image.asset(
    ImageConstants.appHeader,
    fit: BoxFit.cover,
  ),
);

FloatingNavbar navbar = FloatingNavbar(
  borderRadius: 90,
  currentIndex: 0,
  items: [
    FloatingNavbarItem(
      imgPath: ImageConstants.homeIcon,
      route: RouteConstants.landingPage,
    ),
    FloatingNavbarItem(
      imgPath: ImageConstants.shopIcon,
      route: RouteConstants.pesanan,
    ),
    FloatingNavbarItem(
      imgPath: ImageConstants.profileIcon,
      route: RouteConstants.profile,
    ),
  ],
);
