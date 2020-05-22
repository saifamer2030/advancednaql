import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import './Screen11.dart';
import './StatusBar.dart';
import './UserScreen8.dart';
import './Screen20.dart';

class UserScreen13 extends StatelessWidget {
  UserScreen13({
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
                // Adobe XD layer: '20' (shape)
                Container(
              width: 414.0,
              height: 790.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
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
            offset: Offset(0.0, 116.0),
            child: Container(
              width: 414.0,
              height: 31.0,
              decoration: BoxDecoration(),
            ),
          ),
          Transform.translate(
            offset: Offset(226.0, 154.0),
            child: Container(
              width: 176.0,
              height: 29.0,
              decoration: BoxDecoration(),
            ),
          ),
          Transform.translate(
            offset: Offset(0.0, 154.0),
            child: Container(
              width: 192.0,
              height: 38.0,
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
