import 'package:advancednaql/classes/OrderClass.dart';
import 'package:advancednaql/classes/OrderDetailClass.dart';
import 'package:advancednaql/classes/OrderDetailsNameClass.dart';
import 'package:advancednaql/classes/OrderNameClass.dart';
import 'package:advancednaql/classes/OrderPhotoDetailClass.dart';
import 'package:advancednaql/classes/RateClass.dart';
import 'package:advancednaql/classes/UserRateClass.dart';
import 'package:advancednaql/screen/orderprofile.dart';
import 'package:advancednaql/screen/providerprofile.dart';
import 'package:advancednaql/translation/app_localizations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:toast/toast.dart';

import 'editoffer.dart';
import 'editorder.dart';

class Owner extends StatefulWidget {
  String ownerId;
  String ownername;

  Owner(this.ownerId,this.ownername);

  @override
  _OwnerState createState() => _OwnerState();
}

class _OwnerState extends State<Owner> {
  List<RateClass> ratelist = [];
  bool _load = false;
  String _userId;
  final ratingdatabaseReference =
      FirebaseDatabase.instance.reference().child("Rating");

  @override
  void initState() {
    super.initState();
    setState(() {
      _load = true;
    });
 setState(() {
            final ratingdatabaseReference =
                FirebaseDatabase.instance.reference().child("Rating");

      ratingdatabaseReference
                    .child(widget.ownerId)
                    .once()
                    .then((DataSnapshot data1) {
                  var DATA = data1.value;
                  var keys = data1.value.keys;
                  ratelist.clear();
                  print("kkkkkkkkkkkk${DATA.toString()}");
                  for (var individualkey in keys) {
                    RateClass rateclass = new RateClass(
                      DATA[individualkey]['Comment'],
                      DATA[individualkey]['Rate'],
                    );
                    setState(() {
                      ratelist.add(rateclass);
                      print("kkkkkkkkkkkk${DATA[individualkey]['Comment']}${DATA[individualkey]['Rate']}");

                    });

                  }
                });
          });
  }

  final double _minimumPadding = 5.0;
  var _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    Widget loadingIndicator = _load
        ? new Container(
            child: SpinKitCircle(color: Colors.blue),
          )
        : new Container();
    TextStyle textStyle = Theme.of(context).textTheme.subtitle;
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      floatingActionButton: Container(
        height: 30.0,
        width: 30.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              _controller.animateTo(0.0,
                  curve: Curves.easeInOut, duration: Duration(seconds: 1));
            },
            backgroundColor: Colors.white,
            elevation: 20.0,
            child: Icon(
              Icons.arrow_drop_up,
              size: 50,
              color: const Color(0xff4fc3f7),
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
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
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Center(
                  child: Text(
                    widget.ownername,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 20,
                        color: const Color(0xff4fc3f7),
                        fontFamily: 'Gamja Flower',
                        fontStyle: FontStyle.normal),
                  ),
                ),
              ),
            ],
          ),

          Expanded(
              child: ratelist.length == 0
                  ? Center(
                child: new Text(
                  "لا يوجد بيانات",
                ),
              )
                  : new ListView.builder(
                      physics: BouncingScrollPhysics(),
                      controller: _controller,
                      itemCount: ratelist.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return firebasedata(
                          index,
                          ratelist.length,
                          ratelist[index].Comment,
                          ratelist[index].Rate,
                        );

                      })

          )
        ],
      ),
    );
  }

  Widget firebasedata(
      int position,
      int length,
      String coment,
      int rating,
      ) {

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0)),
        //borderOnForeground: true,
        elevation: 10.0,
        margin: EdgeInsets.only(right: 1, left: 1, bottom: 2),
        child: InkWell(
          onTap: () {

          },
          child: Container(
              padding: EdgeInsets.all(0),
              child: Container(
                width: 250,
                height: 80,
                child: Stack(
                  //alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Positioned(
                      top: 5,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child:  Text(
                          coment,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.black,
                              fontFamily: 'Gamja Flower',
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child:SmoothStarRating(
                            allowHalfRating: true,
                            onRated: (v) {},
                            starCount: 5,
                            rating:double.parse("$rating") ,
                            isReadOnly: true,
                            //not changed
                            //setting value
                            size: 20.0,
                            color: Colors.amber,
                            borderColor: Colors.amber,
                            spacing: 0.0)
,                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

}
