import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import './Screen11.dart';
import './StatusBar.dart';
import './UserScreen13.dart';
import './Screen20.dart';

class UserScreen8 extends StatelessWidget {
  UserScreen8({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(0.0, 116.0),
            child:
                // Adobe XD layer: '12' (shape)
                Container(
              width: 414.0,
              height: 790.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.cover,
                ),
              ),
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
                borderRadius: BorderRadius.circular(21.0),
                color: const Color(0xff4fc3f7),
              ),
            ),
          ),
          // Adobe XD layer: 'TopBar' (shape)
          Container(
            width: 414.0,
            height: 86.0,
            decoration: BoxDecoration(
              color: const Color(0xff4fc3f7),
            ),
          ),
          // Adobe XD layer: 'Status Bar' (component)
          StatusBar(),
          Transform.translate(
            offset: Offset(227.0, 157.0),
            child: Container(
              width: 173.0,
              height: 26.0,
              decoration: BoxDecoration(),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 116.0),
            child: Container(
              width: 414.0,
              height: 28.0,
              decoration: BoxDecoration(),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 150.0),
            child: Container(
              width: 189.0,
              height: 46.0,
              decoration: BoxDecoration(),
            ),
          ),
          Transform.translate(
            offset: Offset(152.0, 41.42),
            child:
                // Adobe XD layer: 'logo' (component)
                Container(),
          ),
        ],
      ),
    );
  }
}
