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
                      Container(
                        width: 380,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 380,
                              height: 70,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Card(
                                  elevation: 0.0,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: TextField(
                                      textAlign: TextAlign.right,
                                      keyboardType: TextInputType.text,
                                      textDirection: TextDirection.rtl,
                                      controller: null,
                                      onChanged: (value) {},
                                      //  controller: controller,
                                      decoration: InputDecoration(
                                          labelText: "عنوان الإعلان",
                                          hintText: "عنوان الإعلان",
//                                prefixIcon: Icon(
//                                  Icons.phone_iphone,
//                                  color: Colors.pinkAccent,
//                                ),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)))),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Container(
                              width: 380,
                              child: Material(
                                  elevation: 5.0,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color:  const Color(0xff48B2E1),//48B2E1
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
//                                              borderRadius: BorderRadius.only(
//                                                  topRight: Radius.circular(10.0),
//                                                  bottomRight: Radius.circular(10.0)),
                                        ),
                                        width: 300,
                                        height: 60,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: TextFormField(
                                              // textAlign: TextAlign.right,
                                              obscureText: true,
                                              keyboardType: TextInputType.text,

                                              textDirection: TextDirection.rtl,
                                              controller: null,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                labelText: "الموديل",

                                                fillColor: Colors.white,
                                                filled: true,
                                                errorStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text("الموديل",style: TextStyle(color: Colors.white),),
                                            Container(
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  alignment: Alignment.center,
                                                  matchTextDirection: true,
                                                  repeat: ImageRepeat.noRepeat,
                                                  image: AssetImage(
                                                      "assets/images/ic_modelcar.png"),
                                                ),
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0 ),
                              child: Container(
                                width: 380,
                                child: Material(
                                    elevation: 5.0,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                    color:  const Color(0xff48B2E1),//48B2E1
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
//                                              borderRadius: BorderRadius.only(
//                                                  topRight: Radius.circular(10.0),
//                                                  bottomRight: Radius.circular(10.0)),
                                          ),
                                          width: 300,
                                          height: 60,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: TextFormField(
                                                // textAlign: TextAlign.right,
                                                obscureText: true,
                                                keyboardType: TextInputType.text,

                                                textDirection: TextDirection.rtl,
                                                controller: null,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  labelText: "الشركة",

                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  errorStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Text("الشركة",style: TextStyle(color: Colors.white),),
                                              Container(
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    alignment: Alignment.center,
                                                    matchTextDirection: true,
                                                    repeat: ImageRepeat.noRepeat,
                                                    image: AssetImage(
                                                        "assets/images/ic_compny.png"),
                                                  ),
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0 ),
                              child: Container(
                                width: 380,
                                child: Material(
                                    elevation: 5.0,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                    color:  const Color(0xff48B2E1),//48B2E1
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
//                                              borderRadius: BorderRadius.only(
//                                                  topRight: Radius.circular(10.0),
//                                                  bottomRight: Radius.circular(10.0)),
                                          ),
                                          width: 300,
                                          height: 60,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: TextFormField(
                                                // textAlign: TextAlign.right,
                                                obscureText: true,
                                                keyboardType: TextInputType.text,

                                                textDirection: TextDirection.rtl,
                                                controller: null,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  labelText: "اسم المالك",

                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  errorStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Text("اسم المالك",style: TextStyle(color: Colors.white,fontSize: 10),),
                                              Container(
                                                width: 20,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    alignment: Alignment.center,
                                                    matchTextDirection: true,
                                                    repeat: ImageRepeat.noRepeat,
                                                    image: AssetImage(
                                                        "assets/images/ic_mycar.png"),
                                                  ),
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ),
//                                Container(
//                                  width: 300,
//                                  height: 70,
//                                  child: Padding(
//                                    padding: const EdgeInsets.all(5.0),
//                                    child: Card(
//                                      elevation: 0.0,
//                                      color: Colors.white,
//                                      shape: RoundedRectangleBorder(
//                                        borderRadius: BorderRadius.circular(5),
//                                      ),
//                                      child: Directionality(
//                                        textDirection: TextDirection.rtl,
//                                        child: TextField(
//                                          textAlign: TextAlign.right,
//                                          keyboardType: TextInputType.text,
//                                          textDirection: TextDirection.rtl,
//                                          controller: null,
//                                          onChanged: (value) {},
//                                          //  controller: controller,
//                                          decoration: InputDecoration(
//                                              labelText: "عنوان الإعلان",
//                                              hintText: "عنوان الإعلان",
////                                prefixIcon: Icon(
////                                  Icons.phone_iphone,
////                                  color: Colors.pinkAccent,
////                                ),
//                                              border: OutlineInputBorder(
//                                                  borderRadius:
//                                                      BorderRadius.all(
//                                                          Radius.circular(
//                                                              5.0)))),
//                                        ),
//                                      ),
//                                    ),
//                                  ),
//                                ),
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
