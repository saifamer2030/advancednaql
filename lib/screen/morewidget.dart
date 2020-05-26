import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter/painting.dart';

class MoreWidget extends StatelessWidget {
  MoreWidget({
    Key key,
  }) : super(key: key);
  final double _minimumPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 86.0,
            decoration: BoxDecoration(
              color: const Color(0xff4fc3f7),
            ),
          ),
          Transform.translate(
            offset: Offset(124.0, 39.0),
            child:
                // Adobe XD layer: 'logoBox' (shape)
                Container(
              width: 166.0,
              height: 67.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.center,
                  matchTextDirection: true,
                  repeat: ImageRepeat.noRepeat,
                  image: AssetImage("assets/logowhite.png"),
                ),
                borderRadius: BorderRadius.circular(21.0),
                color: const Color(0xff4fc3f7),
              ),
            ),
          ),
          Form(
            child: Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding * 20,
                  bottom: _minimumPadding * 2,
                  right: _minimumPadding * 2,
                  left: _minimumPadding * 2),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'إعدادات عامة',
                              style: TextStyle(
                                fontFamily: 'DroidArabicKufi-Bold',
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xff1891C7),
                                height: 1.0800000190734864,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            Container(
                              width: 40.0,
                              height: 40.0,
                              child: new Icon(
                                Icons.settings,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: ()=>  Navigator.of(context)
                              .pushNamed('/addnewads'),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: <Widget>[
                              Icon(
                                Icons.keyboard_arrow_left,
                                color: const Color(0xff3F9DC7),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    'إضافة إعلان',
                                    style: TextStyle(
                                      fontFamily: 'DroidArabicKufi',
                                      fontSize: 13,
                                      color: const Color(0xff3F9DC7),
                                      height: 1.2307692307692308,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),

                                  // Adobe XD layer: 'world-wide-web-icon…' (shape)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child:  new Icon(
                                      Icons.add,
                                      color: Colors.grey,

                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: .2,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[
                            Icon(
                              Icons.keyboard_arrow_left,
                              color: const Color(0xff3F9DC7),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'الصفحه الشخصية',
                                  style: TextStyle(
                                    fontFamily: 'DroidArabicKufi',
                                    fontSize: 13,
                                    color: const Color(0xff3F9DC7),
                                    height: 1.2307692307692308,
                                  ),
                                  textAlign: TextAlign.right,
                                ),

                                // Adobe XD layer: 'world-wide-web-icon…' (shape)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: new Icon(
                                    Icons.account_circle,
                                    color: Colors.grey,

                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: .2,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[
                            Icon(
                              Icons.keyboard_arrow_left,
                              color: const Color(0xff3F9DC7),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'اللغة',
                                  style: TextStyle(
                                    fontFamily: 'DroidArabicKufi',
                                    fontSize: 13,
                                    color: const Color(0xff4fc3f7),
                                    height: 1.2307692307692308,
                                  ),
                                  textAlign: TextAlign.right,
                                ),

                                // Adobe XD layer: 'world-wide-web-icon…' (shape)
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: new Icon(Icons.public,color: Colors.grey,)
//                              Container(
//                                width: 25.0,
//                                height: 25.0,
//                                decoration: BoxDecoration(
//                                  image: DecorationImage(
//                                    image: const AssetImage(
//                                        'assets/images/ic_lang.png'),
//                                    fit: BoxFit.fill,
//                                  ),
//                                ),
//                              ),
                                ),
                              ],
                            ),
                          ],
                        ),

//                        Container(
//                          width: MediaQuery.of(context).size.width,
//                          height: .3,
//                          color: Colors.grey,
//                        ),
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.end,
//                          children: <Widget>[
//                            Text(
//                              'الصوت',
//                              style: TextStyle(
//                                fontFamily: 'DroidArabicKufi',
//                                fontSize: 13,
//                                color: const Color(0xff4fc3f7),
//                                height: 1.2307692307692308,
//                              ),
//                              textAlign: TextAlign.right,
//                            ),
//
//                            // Adobe XD layer: 'world-wide-web-icon…' (shape)
//                            Padding(
//                              padding: const EdgeInsets.all(8.0),
//
//                               child: new Icon(Icons.volume_up,color: Colors.grey,),
//
//                            ),
//                          ],
//                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: .2,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[
                            Icon(
                              Icons.keyboard_arrow_left,
                              color: const Color(0xff3F9DC7),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'شروط الاستخدام',
                                  style: TextStyle(
                                    fontFamily: 'DroidArabicKufi',
                                    fontSize: 13,
                                    color: const Color(0xff3F9DC7),
                                    height: 1.2307692307692308,
                                  ),
                                  textAlign: TextAlign.right,
                                ),

                                // Adobe XD layer: 'world-wide-web-icon…' (shape)
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: new Icon(Icons.note,color: Colors.grey,) // Adobe XD layer: 'terms' (shape)
//                                  Container(
//                                width: 25.0,
//                                height: 25.0,
//                                decoration: BoxDecoration(
//                                  image: DecorationImage(
//                                    image: const AssetImage(
//                                        'assets/images/ic_policy.png'),
//                                    fit: BoxFit.fill,
//                                  ),
//                                ),
//                              ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: .2,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[
                            Icon(
                              Icons.keyboard_arrow_left,
                              color: const Color(0xff3F9DC7),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'سياسه الخصوصيه',
                                  style: TextStyle(
                                    fontFamily: 'DroidArabicKufi',
                                    fontSize: 13,
                                    color: const Color(0xff3F9DC7),
                                    height: 1.2307692307692308,
                                  ),
                                  textAlign: TextAlign.right,
                                ),

                                // Adobe XD layer: 'world-wide-web-icon…' (shape)
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: new Icon(Icons.lock,color: Colors.grey,) // Adobe XD layer: 'terms' (shape)
                                ),
                              ],
                            ),
                          ],
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: .2,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'تقييم التطبيق',
                              style: TextStyle(
                                fontFamily: 'DroidArabicKufi',
                                fontSize: 13,
                                color: const Color(0xff3F9DC7),
                                height: 1.2307692307692308,
                              ),
                              textAlign: TextAlign.right,
                            ),

                            // Adobe XD layer: 'world-wide-web-icon…' (shape)
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new Icon(Icons.star,color: Colors.grey,) // Adobe XD layer: 'terms' (shape)
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: .2,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'الشكاوي',
                              style: TextStyle(
                                fontFamily: 'DroidArabicKufi',
                                fontSize: 13,
                                color: const Color(0xff3F9DC7),
                                height: 1.2307692307692308,
                              ),
                              textAlign: TextAlign.right,
                            ),

                            // Adobe XD layer: 'world-wide-web-icon…' (shape)
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new Icon(Icons.report,color: Colors.grey,) // Adobe XD layer: 'terms' (shape)
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: .2,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'مساعدة',
                              style: TextStyle(
                                fontFamily: 'DroidArabicKufi',
                                fontSize: 13,
                                color: const Color(0xff3F9DC7),
                                height: 1.2307692307692308,
                              ),
                              textAlign: TextAlign.right,
                            ),

                            // Adobe XD layer: 'world-wide-web-icon…' (shape)
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new Icon(Icons.help,color: Colors.grey,) // Adobe XD layer: 'terms' (shape)
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: .2,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'نبذة عن التطبيق',
                              style: TextStyle(
                                fontFamily: 'DroidArabicKufi',
                                fontSize: 13,
                                color: const Color(0xff3F9DC7),
                                height: 1.2307692307692308,
                              ),
                              textAlign: TextAlign.right,
                            ),

                            // Adobe XD layer: 'world-wide-web-icon…' (shape)
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new Icon(Icons.smartphone,color: Colors.grey,) // Adobe XD layer: 'terms' (shape)
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: .2,
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              'تسجيل خروج',
                              style: TextStyle(
                                fontFamily: 'DroidArabicKufi',
                                fontSize: 13,
                                color: const Color(0xff3F9DC7),
                                height: 1.2307692307692308,
                              ),
                              textAlign: TextAlign.right,
                            ),

                            // Adobe XD layer: 'world-wide-web-icon…' (shape)
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new Icon(Icons.power_settings_new,color: Colors.grey,) // Adobe XD layer: 'terms' (shape)
                            ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: .2,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
