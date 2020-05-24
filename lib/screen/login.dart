import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class LoginScreen2 extends StatelessWidget {
  LoginScreen2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Stack(
          children: <Widget>[
            Transform.translate(
              offset: Offset(-10.0, 67.0),
              child:
                  // Adobe XD layer: '2' (shape)
                  Container(
                width: 435.0,
                height: 831.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage(''),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Container(
              width: 414.0,
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
            Container(
              width: 168.0,
              height: 46.0,
              decoration: BoxDecoration(),
            ),
            Transform.translate(
              offset: Offset(87.0, 514.33),
              child: SizedBox(
                width: 240.0,
                child: InkWell(
                  onTap: ()=> null,
                  child: Text(
                    'ليس لديك حساب؟ قم بانشاء حساب جديد',
                    style: TextStyle(
                      fontFamily: 'GESSTwoMedium-Medium',
                      fontSize: 12,
                      color: const Color(0xff41a0cb),
                      height: 1.1666666666666667,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            // Adobe XD layer: 'TopBar' (shape)
          ],
        ),
      ),
    );
  }
}

