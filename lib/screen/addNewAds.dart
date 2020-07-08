import 'package:advancednaql/screen/Departmentwedgit.dart';
import 'package:advancednaql/translation/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewAds extends StatefulWidget {
  @override
  _adsState createState() => _adsState();
}

@override
class _adsState extends State<AddNewAds> {
  final double _minimumPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 86.0,
                decoration: BoxDecoration(
                  color: const Color(0xff4fc3f7),
                ),
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: 20,
                  height: 20,
                  child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.arrow_back)),
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
          Form(
            child: Padding(
              padding: EdgeInsets.only(
                right: _minimumPadding,
                left: _minimumPadding,
                top: _minimumPadding * 30,
              ),
              child: Center(
                child: Container(
                  height: 250,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          String user = "user";
                          print("##############$user##############");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Department(user)),
                          );
//                          Navigator.of(context).pushNamed('/department');
                        },
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 75.0,
                              height: 75.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/ic_typeuser.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                  //  width: 160.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color:  Colors.grey[400], //0xff4fc3f7  //0xffeaeaea
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          //width: 150,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                bottomLeft: Radius.circular(5)),
                                            color: Colors
                                                .grey[400], //0xff4fc3f7  //0xffeaeaea
                                          ),
                                          child: Center(
                                            child: Text(
                                              "تشغيل / تأجير : سيارات / معدات",
                                              style: TextStyle(
                                                fontFamily: 'DroidArabicKufi',
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                height: 1.2000000762939453,
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(5),
                                                bottomRight:
                                                    Radius.circular(5)),
                                            color: const Color(
                                                0xff4fc3f7), //0xff4fc3f7  //0xffeaeaea
                                          ),
                                          child: Center(
                                            child: Text(
                                              Translations.of(context)
                                                  .translate(
                                                      'looking_for_a_service'),
                                              style: TextStyle(
                                                fontFamily: 'DroidArabicKufi',
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                height: 1.2000000762939453,
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

//                                  Positioned.fill(
//                                    child: Align(
//                                      alignment: Alignment.center,
//                                      child: Text(
//                                        Translations.of(context).translate('looking_for_a_service'),
//                                        style: TextStyle(
//                                          fontFamily: 'DroidArabicKufi',
//                                          fontSize: 10,
//                                          fontWeight: FontWeight.bold,
//                                          color: const Color(0xff41a0cb),
//                                          height: 1.2000000762939453,
//                                        ),
//                                        textAlign: TextAlign.right,
//                                      ),
//                                    ),
//                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          String user = "provider";
                          print("##############$user##############");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Department(user)),
                          );

//                          Navigator.of(context).pushNamed('/department');
                        },
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 75.0,
                              height: 75.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: const AssetImage(
                                      'assets/images/ic_typeprovider.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                 //   width: 160.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color:Colors.grey[400], //0xff4fc3f7  //0xffeaeaea
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                         // width: 170,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(5),
                                                bottomLeft: Radius.circular(5)),
                                            color: Colors
                                                .grey[400], //0xff4fc3f7  //0xffeaeaea
                                          ),
                                          child: Center(
                                            child: Text(
                                              "تشغيل / تأجير : سيارات / معدات",
                                              style: TextStyle(
                                                fontFamily: 'DroidArabicKufi',
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                height: 1.2000000762939453,
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(5),
                                                bottomRight:
                                                    Radius.circular(5)),
                                            color:Colors.grey[600], //0xff4fc3f7  //0xffeaeaea
                                          ),
                                          child: Center(
                                            child: Text(
                                              Translations.of(context)
                                                  .translate(
                                                      'have_equipment_you_want_to_operate_or_rent'),
                                              style: TextStyle(
                                                fontFamily: 'DroidArabicKufi',
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                height: 1.2000000762939453,
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )

//                            Padding(
//                              padding: const EdgeInsets.all(8.0),
//                              child: Stack(
//                                children: <Widget>[
//                                  Container(
//                                    width: 120.0,
//                                    height: 30.0,
//                                    decoration: BoxDecoration(
//                                      borderRadius: BorderRadius.circular(5.0),
//                                      color: const Color(0xffeaeaea),
//                                    ),
//                                  ),
//                                  Positioned.fill(
//                                    child: Align(
//                                      alignment: Alignment.center,
//                                      child: Text(
//                                        Translations.of(context).translate(
//                                            'have_equipment_you_want_to_operate_or_rent'),
//                                        style: TextStyle(
//                                          fontFamily: 'DroidArabicKufi',
//                                          fontSize: 10,
//                                          fontWeight: FontWeight.bold,
//                                          color: const Color(0xff41a0cb),
//                                          height: 1.2000000762939453,
//                                        ),
//                                        textAlign: TextAlign.right,
//                                      ),
//                                    ),
//                                  ),
//                                ],
//                              ),
//                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
