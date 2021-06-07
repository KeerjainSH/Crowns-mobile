import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:crowns/utils/image_constants.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// Header home page
            Container(
              width: double.infinity,
              child: Image.asset(
                ImageConstants.homeHeader,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 55),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// Jahit sekarang section
                Container(
                  padding: EdgeInsets.only(left: 29, right: 29),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Create our Own Style',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: 2),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Mau berkreasi apa hari ini?',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/catalog');
                        },
                        child: Image.asset(
                          ImageConstants.jahitSeakarangBanner,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 42),

                /// Kreasi Section
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 29, right: 29),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Kreasi',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 2),
                      Container(
                        padding: EdgeInsets.only(left: 29, right: 29),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Apa yang kamu butuhkan saat ini?',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(width: 29),

                            // kreasi 1
                            Container(
                              margin: EdgeInsets.only(right: 29),
                              height: 120,
                              width: 120,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0,
                                      offset: Offset(-5, 3),
                                      blurRadius: 2,
                                    )
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(18.0),
                                      child: Image.asset(
                                        ImageConstants.kreasiDisplay1,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(12),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          'Batik',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),

                            // kreasi 2
                            Container(
                              margin: EdgeInsets.only(right: 29),
                              height: 120,
                              width: 120,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0,
                                      offset: Offset(-5, 3),
                                      blurRadius: 2,
                                    )
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(18.0),
                                      child: Image.asset(
                                        ImageConstants.kreasiDisplay1,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(12),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          'Batik',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),

                            // kreasi 3
                            Container(
                              margin: EdgeInsets.only(right: 29),
                              height: 120,
                              width: 120,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0,
                                      offset: Offset(-5, 3),
                                      blurRadius: 2,
                                    )
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(18.0),
                                      child: Image.asset(
                                        ImageConstants.kreasiDisplay1,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(12),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          'Batik',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 24),
                SizedBox(height: 100)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
