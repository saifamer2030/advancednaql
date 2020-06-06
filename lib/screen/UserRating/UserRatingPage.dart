
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../fragmentbar.dart';
import 'RatingClass.dart';

class UserRatingPage extends StatefulWidget {
  UserRatingPage(this.rating);

  final Rating rating;

  @override
  _UserRatingPageState createState() => new _UserRatingPageState();
}

final mDatabase = FirebaseDatabase.instance.reference();

final ratingReference = FirebaseDatabase.instance.reference().child('Rating');
final ratingAvrageReference = FirebaseDatabase.instance.reference().child('userdata');

class _UserRatingPageState extends State<UserRatingPage> {
  List<Rating> itemsRate;
  var Rate = 0.0;
  var _averageRating , _totalRate,_totalCust;
  FirebaseAuth _firebaseAuth;
  Query _query;


  // تعريف الايتم المراد ادخال قيم فيها
  TextEditingController _rateController;
  TextEditingController _commentController;

/////////////// لتهئة الداتا بيز وعرض البيانات فور فتح التطبيق ///////////
  @override
  void initState() {
    super.initState();
    _query = mDatabase.child('Rating');
    _firebaseAuth = FirebaseAuth.instance;
    getRatingAvrage();
    // ربط الايتم بالقيم
    _rateController = new TextEditingController(text: widget.rating.rate);
    _commentController = new TextEditingController(text: widget.rating.comment);
  }

  void getRatingAvrage() async {
   // FirebaseUser usr = await _firebaseAuth.currentUser();

      mDatabase
          .child("userdata")
          .child(widget.rating.id)
          .once()
          .then((DataSnapshot snapshot) {
        Map<dynamic, dynamic> values = snapshot.value;
        ///var result = values['Rate'] / values.length;
            //print(result);
            setState(() {
              _totalRate = values['rating'];
              _totalCust = values['custRate'];
        });
//        if (values != null) {
//          /*HelperFunc.showToast("hii ${values['cName']}", Colors.red);
//          */
//          setState(() {
//            _cName = values['cName'].toString();
//          });
//        }
      });

  }

  /// هذا الفانكشن لغلق الداتا بيز ///
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Container(
            width: width,
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
            width: width,
            height: height,
            child: Center(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
//                        child: Container(
//                          height: 80,
//                          width: 80,
//                          decoration: BoxDecoration(
//                              shape: BoxShape.circle,
//                              border: new Border.all(
//                                  color: const Color(0xff4fc3f7), width: 3),
//                              image: DecorationImage(
//                                fit: BoxFit.cover,
//                                image:
//                                new AssetImage("assets/logo.png"),
//                              )),
//                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Center(
                        child: Text(
                          "تقييمك لمقدم الخدمة يدعم تحسين الخدمة",
                          style: TextStyle(fontSize: 20.0),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: RatingBar(
                        initialRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);

                          setState(() {
                            Rate = rating;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Center(
                      child: Text("${Rate}"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, right: 10.0, left: 10.0, bottom: 10.0),
                    child: Center(
                      child: TextField(
                        controller: _commentController,
                        onChanged: (value) {},
                        //  controller: controller,
                        decoration: InputDecoration(
                            labelText: "اكتب تعليق هنا",
                            hintText: "اكتب تعليق هنا",
                            prefixIcon: Icon(Icons.comment),
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0)))),
                      ),
                    ),
                  ),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        width: width,
                        child: RaisedButton(
                          child: new Text("إرسال التقييم",
                              style: TextStyle(fontSize: 15.0)),
                          textColor: Colors.white,
                          color:  const Color(0xff48B2E1),
                          onPressed: () {
                            getUser(com: _commentController.text);
                          },
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(15.0)),
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

  void getUser({String com}) async {

    FirebaseUser usr = await _firebaseAuth.currentUser();
    if (usr != null && com != "" && Rate != 0.0) {
      ratingReference.child(widget.rating.id).child(usr.uid).set({
        'Comment': _commentController.text,
        'Rate': Rate,
      });
      print('total rate $_totalRate');
      ratingAvrageReference.child(widget.rating.id).update({
        'rating': (double.parse(_totalRate)+Rate).toString(),
      'custRate':_totalCust+1
      }).then((_) {
        Fluttertoast.showToast(
            msg: "تم إرسال تقيمك بنجاح",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            fontSize: 15.0,
            textColor: Colors.black,
            backgroundColor: Colors.lightBlueAccent);
        Navigator.push(
          context,
          new MaterialPageRoute(
              builder: (BuildContext context) =>
              new Fragmentnaql()),
        );
      });
    } else {
      Fluttertoast.showToast(
          msg: "برجاء إضافة تعليق وتقييم",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          fontSize: 15.0,
          textColor: Colors.black,
          backgroundColor: Colors.lightBlueAccent);
    }
  }

//  Widget _starRating() {
//    double _calculateAverage() {
//      // calculate average, may have latency issues once we scale
//      // try cloud functions
//      if (widget.rating.rate != null) {
//        double _calc = 0;
//        for (int i = 0; i < widget.rating.rate.length; i++) {
//          _calc = _calc + widget.rating.rate[i]['rating'];
//        }
//        return _averageRating = _calc / widget.rating.rate.length;
//      } else {
//        return 0;
//      }
//    }
//  }
}
