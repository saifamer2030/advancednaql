import 'package:advancednaql/screen/addNewAds.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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
  String data = "غير موافق";

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
                top: _minimumPadding * 30,
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
                              top: 20.0,
                            ),
                            child: Text(
                                "وَأَوْفُواْ بِعَهْدِ ٱللَّهِ إِذَا عَٰهَدتُّمْ وَلَا تَنقُضُواْ"
                                " ٱلْأَيْمَٰنَ بَعْدَ تَوْكِيدِهَا وَقَدْ جَعَلْتُمُ ٱللَّهَ عَلَيْكُمْ كَفِيلًا ۚإِنَّ ٱللَّهَ يَعْلَمُ مَا تَفْعَلُون\nَ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Text(" صِّدٍَّقٍَّ آلِّلِّهِّ آلِّعََّظِِّيِّمِِّ",
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
                              top: 10.0,
                            ),
                            child: Text(
                                "اتعهد واقسم بالله انا المعلن ان ادفع عمولة التطبيق وهي ١٪ من قيمة الخدمة في حالة إتمامها عن طريق التطبيق او بسبب التطبيق وان هذة العمولة هي امانة في ذمتي. ملاحظة عمولة التطبيق هي علي المعلن ولا تبرأ ذمة المعلن من العمولة إلا في حالة دفعها",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
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
                              isSwitched ? "موافق" : data,
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: .5,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                            ),
                            child: Text(
                                "اتعهد انا المعلن ان جميع المعلومات التي اذكرها بالاعلان صحيحة وفي القسم الصحيح واتعهد بان الصور التي سوف يتم عرضها هي صور حديثة لنفس الخدمة وليست لخدمة اخري مشابهة.",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
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
                              isSwitched2 ? "موافق" : data,
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: .5,
                            color: Colors.grey,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                            ),
                            child: Text(
                                "اتعهد انا المعلن بان اقوم بدفع العمولة خلال اقل من ١٠ ايام من تاريخ استلام كامل سعر الخدمة.",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
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
                              isSwitched3 ? "موافق" : data,
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: .5,
                            color: Colors.grey,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: new RaisedButton(
                              child: new Text("التالي"),
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
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => AddNewAds()));

      print("go_______");
//      setState(() {
//        Navigator.of(context).pushNamed('/addnewads');
//      });
    } else {
      return null;
    }
  }
}
