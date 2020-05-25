import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MoreWidget extends StatelessWidget {
  MoreWidget({
    Key key,
  }) : super(key: key);
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

        ],

      ),

    );
  }
}
