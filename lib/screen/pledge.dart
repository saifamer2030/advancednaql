import 'package:advancednaql/screen/addNewAds.dart';
import 'package:advancednaql/screen/newoffer.dart';
import 'package:advancednaql/translation/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Pledge extends StatefulWidget {
  @override
  __pledgeState createState() => __pledgeState();
}

@override
class __pledgeState extends State<Pledge> {
  final double _minimumPadding = 5.0;
  bool isSwitched = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    String data = Translations.of(context).translate('not_agree');
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color(0xffffffff),
      body: Stack(children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              width:  MediaQuery.of(context).size.width,
              height: 86.0,
              child: InkWell(
                onTap: () => Navigator.pop(context),

                child: Container(
                  alignment: Alignment.centerLeft,
                  width: 50,
                  height: 50,
                  child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Padding(
                        padding: const EdgeInsets.only(left:8.0,top:20),
                        child: Icon(Icons.arrow_back,color: Colors.white,),
                      )
                  ),
                ),
              ),
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
        Form(
            child: Center(
          child: Padding(
            padding: EdgeInsets.only(
                top: _minimumPadding * 20,
                left: _minimumPadding,
                right: _minimumPadding),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Center(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            " بِسْمِ اللَّـهِ الرَّحْمَـٰنِ الرَّحِيمِ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 0,left: 0),
                                child: Text(
                                    "وَأَوْفُواْ بِعَهْدِ ٱللَّهِ إِذَا عَٰهَدتُّمْ وَلَا تَنقُضُواْ"
                                    "ٱلْأَيْمَٰنَ بَعْدَ تَوْكِيدِهَا وَقَدْ\n              جَعَلْتُمُ ٱللَّهَ عَلَيْكُمْ كَفِيلًا ۚإِنَّ ٱللَّهَ يَعْلَمُ مَا تَفْعَلُون",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ),
                          ),
                          Text("صدق الله العظيمِِّ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: .5,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5.0,
                            ),
                            child: Text(
                                Translations.of(context).translate('pledge1'),
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: Switch(
                                  value: isSwitched,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched = value;
                                      print(isSwitched);
                                    });
                                  },
                                  activeTrackColor: const Color(0xff4fc3f7),
                                  activeColor: const Color(0xff1891C7),
                                ),
                              ),
                              Container(
                                width: 100.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: const Color(0xffeaeaea),
                                ),
                                child: Center(
                                    child: Text(
                                  isSwitched
                                      ? Translations.of(context).translate('oK')
                                      : data,
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                              ),
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: .5,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5.0,
                            ),
                            child: Text(
                                Translations.of(context).translate('pledge2'),
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                child: Switch(
                                  value: isSwitched2,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched2 = value;
                                      print(isSwitched2);
                                    });
                                  },
                                  activeTrackColor: const Color(0xff4fc3f7),
                                  activeColor: const Color(0xff1891C7),
                                ),
                              ),
                              Container(
                                width: 100.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: const Color(0xffeaeaea),
                                ),
                                child: Center(
                                    child: Text(
                                      isSwitched2
                                          ? Translations.of(context).translate('oK')
                                          : data,
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: .5,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5.0,
                            ),
                            child: Text(
                                Translations.of(context).translate('pledge3'),
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[
                             Center(
                               child: Switch(
                                 value: isSwitched3,
                                 onChanged: (value) {
                                   setState(() {
                                     isSwitched3 = value;
                                     print(isSwitched3);
                                   });
                                 },
                                 activeTrackColor: const Color(0xff4fc3f7),
                                 activeColor: const Color(0xff1891C7),
                               ),
                             ),
                             Container(
                               width: 100.0,
                               height: 30.0,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(5.0),
                                 color: const Color(0xffeaeaea),
                               ),
                               child: Center(
                                   child: Text(
                                     isSwitched3
                                         ? Translations.of(context).translate('oK')
                                         : data,
                                     style: TextStyle(
                                       fontStyle: FontStyle.italic,
                                       fontSize: 13,
                                       fontWeight: FontWeight.bold,
                                     ),
                                   )),
                             ),
                           ],
                         ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: .5,
                            color: Colors.grey,
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: new RaisedButton(
                              child: new Text(
                                  Translations.of(context).translate('next')),
                              textColor: Colors.white,
                              color: const Color(0xff48B2E1),
                              onPressed: _counterButtonPress,

                              //#48B2E1
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(10.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ))
      ]),
    );
  }

  Future<void> _counterButtonPress() async {
    if (isSwitched && isSwitched2 && isSwitched3) {
      Navigator.of(context).pushNamed('/addnewads');
      //  print("go_______");
//      setState(() {
//        Navigator.of(context).pushNamed('/addnewads');
//      });
    } else {
      return showInSnackBar(
          Translations.of(context).translate('please_agree_to_the_terms'));
    }
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(
        value,
        style: TextStyle(color: const Color(0xff48B2E1)),
      ),
    ));
  }
}
