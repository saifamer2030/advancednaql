import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Splash extends StatelessWidget {
  Splash({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          // Adobe XD layer: 'BG' (shape)
          Container(
            width: 414.0,
            height: 896.0,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
            ),
          ),
          Transform.translate(
            offset: Offset(46.0, 302.0),
            child:
                // Adobe XD layer: 'logo' (component)
                Container(
                  child: new Image.asset("assets/logo.png",
                      fit: BoxFit.fill),
                ),
          ),
        ],
      ),
    );
  }
}
