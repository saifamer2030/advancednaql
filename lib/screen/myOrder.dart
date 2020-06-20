import 'package:advancednaql/classes/AlarmaClass.dart';
import 'package:advancednaql/classes/MyOrderClass.dart';
import 'package:advancednaql/classes/OrderClass.dart';
import 'package:advancednaql/classes/OrderNameClass.dart';
import 'package:advancednaql/classes/UserRateClass.dart';
import 'package:advancednaql/screen/orderprofile.dart';
import 'package:advancednaql/screen/providerprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'package:toast/toast.dart';

import 'ModelsForChating/chat.dart';

class myOrder extends StatefulWidget {
  @override
  _myOrderState createState() => _myOrderState();
}

class _myOrderState extends State<myOrder> {
  List<MyOrderClass> alarmlist = [];

  //List<String> namelist = [];
  bool _load = false;
  String _userId;
  final databasealarm = FirebaseDatabase.instance.reference().child("MyOrder");

  @override
  void initState() {
    super.initState();
    setState(() {
      _load = true;
    });

    FirebaseAuth.instance.currentUser().then((user) => user == null
        ? null
        : setState(() {
            _userId = user.uid;
            final databasealarm =
                FirebaseDatabase.instance.reference().child("MyOrder");
//            orderdatabaseReference.once().then((DataSnapshot data) {
//              var uuId = data.value.keys;

            //   for (var id in uuId) {
            databasealarm.child(_userId).once().then((DataSnapshot data1) {
              var DATA = data1.value;
              var keys = data1.value.keys;
              alarmlist.clear();
              //  namelist.clear();
              for (var individualkey in keys) {
                MyOrderClass alarmaalass = new MyOrderClass(
                  DATA[individualkey]['wid'],
                  DATA[individualkey]['Name'],
                  DATA[individualkey]['title'],
                  DATA[individualkey]['statusOrder'],
                  DATA[individualkey]['cadv'],
                  DATA[individualkey]['curl'],
                  DATA[individualkey]['cType'],
                );



                setState(() {
                  alarmlist.add(alarmaalass);

                });
              }
            });
            // }
            //  });
          }));
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
              ),
              Transform.translate(
                offset: Offset(0.0, -42.0),
                child:
                    // Adobe XD layer: 'logoBox' (shape)
                    Center(
                  child: Container(
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
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Expanded(
                child: Center(
              child: alarmlist.length == 0
                  ? new Center(
                     child: loadingIndicator,
                    )
                  : new ListView.builder(
                      physics: BouncingScrollPhysics(),
                      controller: _controller,
                      // reverse: true,
                      itemCount: alarmlist.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return InkWell(
                          child: _firebasedata(
                            index,
                            alarmlist.length,
                            alarmlist[index].wid,
                            alarmlist[index].Name,
                            alarmlist[index].title,
                            alarmlist[index].statusOrder,
                            alarmlist[index].cadv,
                            alarmlist[index].curl,
                            alarmlist[index].cType,
                          ),




//                                                    onTap: () {
//                                                      if(_userId==commentlist[index].cuserid){
//                                                        FirebaseDatabase.instance
//                                                            .reference()
//                                                            .child("commentsdata")
//                                                            .child(widget.cId)
//                                                            .child(commentlist[index].cheaddate)
//                                                            .remove()
//                                                            .whenComplete(() {
//
//                                                          setState(() {
//                                                            commentlist.removeAt(index);
//                                                          });
//                                                          Toast.show("تم حذف التعليق", context,
//                                                              duration: Toast.LENGTH_SHORT,
//                                                              gravity: Toast.BOTTOM);
//                                                        });
//                                                      }
//                                                      else{
//                                                        Toast.show("ليس تعليقك", context,
//                                                            duration: Toast.LENGTH_SHORT,
//                                                            gravity: Toast.BOTTOM);
//                                                      }
//                                                    }
                        );
                      }),
            )),
          ),

          /** Expanded(
              child: alarmlist.length == 0
              ? Center(
              child:  loadingIndicator,)
              : new ListView.builder(
              physics: BouncingScrollPhysics(),
              controller: _controller,
              itemCount: alarmlist.length,
              itemBuilder: (BuildContext ctxt, int index) {
              return InkWell(
              child: firebasedata(
              index,
              alarmlist.length,
              alarmlist[index].alarmid,
              alarmlist[index].wid,
              alarmlist[index].Name,
              alarmlist[index].cType,
              alarmlist[index].cDateID,
              alarmlist[index].arrange,
              ),
              onTap: () {});
              })

              )**/
        ],
      ),
    );
  }

  Widget _firebasedata(
    int position,
    int length,
    String wid,
    String Name,
    String titel,
    int statusOrder,
    String cadv,
    String curl,
    String cType,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
              child: Row(
                children: <Widget>[
                  Container(
                    color: Colors.grey[100],
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: curl == null
                            ? new Image.asset("assets/images/ic_bluecar.png",
                            fit: BoxFit.fill)
                            : new Image.network(
                          curl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    width: 100,
                    height: 130,
                  ),
                  Container(
                    height: 130,
                    child: Stack(
                      //alignment: Alignment.bottomCenter,
                      children: <Widget>[
//                        Positioned(
//                          top: 0,
//                          left: 0,
//                          child: Container(
//                            height: 30,
//                            width: 50,
//                            decoration: BoxDecoration(
//                              borderRadius: BorderRadius.circular(4.0),
//                              color: cType == "طلب" ? Colors.green : Colors.red,
//                            ),
//                            child: Padding(
//                              padding: const EdgeInsets.all(5.0),
//                              child: Text(
//                                cType,
//                                style: TextStyle(
//                                    color: Colors.white,
//                                    fontFamily: 'Gamja Flower',
//                                    fontWeight: FontWeight.bold),
//                              ),
//                            ),
//                          ),
//                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(
                              titel,
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'Gamja Flower',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Name != null
                                ? Text(
                              Name,
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontFamily: 'Gamja Flower',
                                  fontStyle: FontStyle.normal),
                            )
                                : Text(" "),
                          ),
                        ),
//                        Positioned(
//                          top: 40,
//                          right: 0,
//                          child: Padding(
//                            padding: const EdgeInsets.all(5.0),
//                            child: cRate > 0.0
//                                ? SmoothStarRating(
//                                allowHalfRating: true,
//                                onRated: (v) {},
//                                starCount: 5,
//                                rating: cRate,
//                                isReadOnly: true,
//                                //not changed
//                                //setting value
//                                size: 20.0,
//                                color: Colors.amber,
//                                borderColor: Colors.amber,
//                                spacing: 0.0)
//                                : new Text(
//                              'منضم حديثا',
//                              style: TextStyle(
//                                  color: Colors.lightBlue,
//                                  fontFamily: 'Gamja Flower',
//                                  fontWeight: FontWeight.bold,
//                                  fontSize: 15.0,
//                                  fontStyle: FontStyle.normal),
//                            ),
//                          ),
//                        ),
//                        Positioned(
//                          top: 100,
//                          right: 0,
//                          child: Padding(
//                            padding: const EdgeInsets.all(5.0),
//                            child: Row(
//                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                              children: <Widget>[
//                                (clat1 == "" || clat1 == null)
//                                    ? Text("")
//                                    : Text(
//                                  "$clat1",
//                                  textDirection: TextDirection.rtl,
//                                  textAlign: TextAlign.right,
//                                  style: TextStyle(
//                                      fontFamily: 'Gamja Flower',
//                                      fontSize: 10.0,
//                                      fontStyle: FontStyle.normal),
//                                ),
//                                (clat1 == "" || clat1 == null)
//                                    ? Text("")
//                                    : new Icon(
//                                  Icons.location_on,
//                                  color: Colors.blue,
//                                  size: 15,
//                                ),
//                                SizedBox(
//                                  height: _minimumPadding,
//                                  width: _minimumPadding * 4,
//                                ),
//                                (clat2 == "" || clat2 == null)
//                                    ? Text("")
//                                    : Text(
//                                  "الواجهة:$clat2",
//                                  textDirection: TextDirection.rtl,
//                                  textAlign: TextAlign.right,
//                                  style: TextStyle(
//                                      fontFamily: 'Gamja Flower',
//                                      fontSize: 10.0,
//                                      fontStyle: FontStyle.normal),
//                                ),
//                                SizedBox(
//                                  height: _minimumPadding,
//                                  width: _minimumPadding,
//                                ),
//                                Text(
//                                  "وقت التحرك: ",
//                                  textDirection: TextDirection.rtl,
//                                  textAlign: TextAlign.right,
//                                  style: TextStyle(
//                                      fontFamily: 'Gamja Flower',
//                                      fontSize: 10.0,
//                                      fontStyle: FontStyle.normal),
//                                ),
//                                SizedBox(
//                                  height: _minimumPadding,
//                                  width: _minimumPadding,
//                                ),
//                                Text(
//                                  "منذ: $cdate",
//                                  textDirection: TextDirection.rtl,
//                                  textAlign: TextAlign.right,
//                                  style: TextStyle(
//                                      fontFamily: 'Gamja Flower',
//                                      fontSize: 10.0,
//                                      fontStyle: FontStyle.normal),
//                                ),
//                              ],
//                            ),
//                          ),
//                        ),
//                        Column(
//                          crossAxisAlignment: CrossAxisAlignment.start,
//                          children: <Widget>[
//                            Padding(
//                              padding: const EdgeInsets.only(
//                                  left: 10, right: 5, top: 5, bottom: 5),
//                              child: Text(
//                                " حالة الطلب :",
//                                textDirection: TextDirection.rtl,
//                                textAlign: TextAlign.right,
//                              ),
//                            ),
//                          ],
//                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
