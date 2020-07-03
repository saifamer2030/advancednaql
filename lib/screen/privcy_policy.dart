import 'dart:ui';

import 'package:flutter/material.dart';

class PrivcyPolicy extends StatefulWidget {
  @override
  __PrivcyPolicyState createState() => __PrivcyPolicyState();
}

@override
class __PrivcyPolicyState extends State<PrivcyPolicy> {
  final double _minimumPadding = 5.0;
  bool isSwitched = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xffffffff),
      body:// Adobe XD layer: '30' (shape)
      Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width:  MediaQuery.of(context).size.width,
                height: 86.0,
                child: InkWell(
                  onTap: () => Navigator.pop(context),

                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: 50,
                    height: 50,
                    child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Padding(
                          padding: const EdgeInsets.only(left:8.0,top:20),
                          child: Icon(Icons.arrow_back,color: Colors.white,),
                        )
                    ),
                  ),
                ),
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
                    width: 156.0,
                    height: 57.0,
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
          Padding(
            padding: EdgeInsets.only(
                top: _minimumPadding * 23,
                bottom: _minimumPadding * 2,
                right: _minimumPadding * 2,
                left: _minimumPadding * 2),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'سياسة الخصوصية',
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
                        Icons.lock,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Container(
                  width:  MediaQuery.of(context).size.width,
                  height:  MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('assets/images/image_privcy_policy.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    ); }
}