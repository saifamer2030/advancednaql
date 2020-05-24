import 'package:flutter/material.dart';
import 'dart:ui' as ui;
class Splash  extends StatefulWidget {

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash > {
  init() async {
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () => init());
  }

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
          Center(
            child: Container(
              width: 300.0,
             // height: 896.0,
              child: new Image.asset("assets/logo.png",
                  fit: BoxFit.fill),
            ),
          ),
        ],
      ),
    );
  }
}