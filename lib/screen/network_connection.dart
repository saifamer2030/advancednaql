import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ConnectionScreen extends StatelessWidget {
  // final Function action;

  ConnectionScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width:  MediaQuery.of(context).size.width,
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
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    width: 90.0,
                    height: 100.0,
                    child: Image.asset('assets/images/antenna.png'),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "برجاء مراجعة الاتصال بالشبكة",
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text("يوجد خطأ بالشبكة", style: TextStyle(fontSize: 16.0)),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    height: 44.0,
                    margin: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      //color: CustomColors.kTabBarIconColor,
                    ),
                    child: InkWell(
                      onTap: () async {
                        try {
                          final result = await InternetAddress.lookup('google.com');
                          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                            FirebaseAuth.instance.currentUser().then((user) => user !=
                                null
                                ? Navigator.of(context).pushReplacementNamed(
                                '/fragmentnaql') //setState(() {Navigator.of(context).pushReplacementNamed('/fragmentnaql'); })
                                : Navigator.of(context)
                                .pushReplacementNamed('/login'));
                          }
                        } on SocketException catch (_) {
//Toast.show(_.toString()+"jjjjjjjjjjjj",context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);

                        }
                      },
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.refresh),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "حاول ثانيأ",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),

//                  RaisedButton(
//                    //color: CustomColors.kTabBarIconColor,
//                    onPressed: () async {
//                      try {
//                        final result = await InternetAddress.lookup('google.com');
//                        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//                          FirebaseAuth.instance.currentUser().then((user) => user != null
//                              ? Navigator.of(context).pushReplacementNamed('/fragmentnaql')//setState(() {Navigator.of(context).pushReplacementNamed('/fragmentnaql'); })
//                              : Navigator.of(context).pushReplacementNamed('/login'));
//                        }
//                      } on SocketException catch (_) {
//
////Toast.show(_.toString()+"jjjjjjjjjjjj",context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);
//
//                      }
//                    },
//                    child: Text(
//                      "حاول ثانيأ",
//                      style: TextStyle(
//                          fontSize: 16.0,
//                          color: Colors.white,
//                          fontWeight: FontWeight.bold),
//                    ),
//                    shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(10.0),
//                    ),
//                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
