import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewOffer extends StatefulWidget {
  @override
  _newoffer createState() => _newoffer();
}

@override
class _newoffer extends State<NewOffer> {
  final double _minimumPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(children: <Widget>[
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
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: _minimumPadding * 18,
              ),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        width: 200,
                        height: 200,
                        color: const Color(0xffEDEBEB),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  alignment: Alignment.center,
                                  matchTextDirection: true,
                                  repeat: ImageRepeat.noRepeat,
                                  image: AssetImage(
                                      "assets/images/ic_bluecar.png"),
                                ),
                              ),

                            ),
                            Container(
                              width: 70,
                                height: 70,
                                child: Icon(
                              Icons.add_circle,
                              color: Colors.grey,
                            ))
                          ],
                        ),
                      ),
                    ],
                  )
//                  Container(
//                    width: 200,
//                    height: 200,
//                    color: const Color(0xffEDEBEB),
//                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
