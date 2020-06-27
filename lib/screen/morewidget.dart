import 'package:advancednaql/screen/addNewAds.dart';
import 'package:advancednaql/screen/personal_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/painting.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../translation/helper_func.dart';
import 'login.dart';

class MoreWidget extends StatefulWidget {
  MoreWidget({
    Key key,
  }) : super(key: key);

  @override
  _MoreWidget createState() => _MoreWidget();
}

final double _minimumPadding = 5.0;
String _userId;

class _MoreWidget extends State<MoreWidget> {
  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.currentUser().then((user) => user == null
        ? null
        : setState(() {
            _userId = user.uid;
          }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 86.0,
                decoration: BoxDecoration(
                  color: const Color(0xff4fc3f7),
                ),
              ),
              Transform.translate(
                offset: Offset(0.0, -42.0),
                child:
                    // Adobe XD layer: 'logoBox' (shape)
                    Center(
                  child: Container(
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
              ),
            ],
          ),
          Form(
            child: Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding * 23,
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
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed('/pledge');
//                            Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => AddNewAds()),
//                            );
                          },

                          // Navigator.of(context).pushNamed('/addnewads'),
//                              Navigator.of(context).pushNamed('/newoffer'),
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
                                    child: new Icon(
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
                        InkWell(
                          onTap: () => Navigator.of(context)
                              .pushNamed('/myadvertisement'),
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
                                    'إعلاناتي',
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
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          alignment: Alignment.center,
                                          image: AssetImage(
                                              "assets/images/ic_ads.png"),
                                        ),
                                      ),
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
                        InkWell(
                          onTap: () =>
                              Navigator.of(context).pushNamed('/homechatroom'),
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
                                    'محادثاتي',
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
                                      Icons.email,
                                      color: Colors.grey,
                                    ),

//                                    child:  new Icon(
//                                      Icons.chat,
//                                      color: Colors.grey,
//
//                                    ),
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
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PersonalPage()),
                            );
                          },
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
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: .2,
                          color: Colors.grey,
                        ),
                        InkWell(
                          onTap: () {
                            HelperFunc.reopenSetting(context);
                          },
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
                                    'اللغة',
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
                                        Icons.public,
                                        color: Colors.grey,
                                      )
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
                        InkWell(
                          onTap: () =>
                              Navigator.of(context).pushNamed('/termsuse'),
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
                                      child: new Icon(
                                        Icons.note,
                                        color: Colors.grey,
                                      ) // Adobe XD layer: 'terms' (shape)
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
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: .2,
                          color: Colors.grey,
                        ),
                        InkWell(
                          onTap: () =>
                              Navigator.of(context).pushNamed('/privcypolicy'),
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
                                      child: new Icon(
                                        Icons.lock,
                                        color: Colors.grey,
                                      ) // Adobe XD layer: 'terms' (shape)
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
                                child: new Icon(
                                  Icons.star,
                                  color: Colors.grey,
                                ) // Adobe XD layer: 'terms' (shape)
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
                                child: new Icon(
                                  Icons.report,
                                  color: Colors.grey,
                                ) // Adobe XD layer: 'terms' (shape)
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
                                child: new Icon(
                                  Icons.help,
                                  color: Colors.grey,
                                ) // Adobe XD layer: 'terms' (shape)
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
                                child: new Icon(
                                  Icons.smartphone,
                                  color: Colors.grey,
                                ) // Adobe XD layer: 'terms' (shape)
                                ),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: .2,
                          color: Colors.grey,
                        ),
                        InkWell(
                          onTap: () {
                            FirebaseAuth.instance.signOut();
                            //        Navigator.of(context, rootNavigator: false).push(MaterialPageRoute(builder: (context) => LoginScreen2(), maintainState: false));
//                            Navigator.of(context, rootNavigator: false).push(MaterialPageRoute(
//                                builder: (context) => Screen4(), maintainState: false));
                            //  Navigator.of(context).pushReplacementNamed('/login');
                            Navigator.of(context)
                                .pushReplacementNamed('/login');
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
////                            InkWell(
////                              onTap: () {
////                                print("kkkkkkkkkkkclick");
//                                FirebaseAuth.instance.signOut();
//                                Navigator.of(context).pushNamed('/login');
////
////                              },
////
////                            ),
                              _userId == null
                                  ? Text(
                                      'تسجيل الدخول',
                                      style: TextStyle(
                                        fontFamily: 'DroidArabicKufi',
                                        fontSize: 13,
                                        color: const Color(0xff3F9DC7),
                                        height: 1.2307692307692308,
                                      ),
                                      textAlign: TextAlign.right,
                                    )
                                  : Text(
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
                                  child: new Icon(
                                    Icons.power_settings_new,
                                    color: Colors.grey,
                                  ) // Adobe XD layer: 'terms' (shape)
                                  ),
                            ],
                          ),
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
