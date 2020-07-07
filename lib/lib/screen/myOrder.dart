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
import 'login.dart';

class myOrder extends StatefulWidget {
  @override
  _myOrderState createState() => _myOrderState();
}

class _myOrderState extends State<myOrder> {
  List<MyOrderClass> myorderlist = [];

  //List<String> namelist = [];
  bool _load = false;
  String _userId;
  final databasemyorder =
      FirebaseDatabase.instance.reference().child("MyOrder");

  @override
  void initState() {
    super.initState();
    setState(() {
      _load = true;
    });

    FirebaseAuth.instance.currentUser().then((user) => user == null
        ? Navigator.of(context, rootNavigator: false).push(MaterialPageRoute(
            builder: (context) => LoginScreen2(), maintainState: false))
        : setState(() {
            _userId = user.uid;
            final databasemyorder =
                FirebaseDatabase.instance.reference().child("MyOrder");
//           orderdatabaseReference.once().then((DataSnapshot data) {
//              var uuId = data.value.keys;

            //   for (var id in uuId) {
            databasemyorder.child(_userId).once().then((DataSnapshot data1) {
              var DATA = data1.value;
              var keys = data1.value.keys;
              myorderlist.clear();
              //  namelist.clear();
              for (var individualkey in keys) {
                MyOrderClass myorderclass = new MyOrderClass(
                  DATA[individualkey]['Uid'],
                  DATA[individualkey]['wid'],
                  DATA[individualkey]['pid'],
                  DATA[individualkey]['Name'],
                  DATA[individualkey]['title'],
                  DATA[individualkey]['statusOrder'],
                  DATA[individualkey]['cadv'],
                  DATA[individualkey]['curl'],
                  DATA[individualkey]['cType'],
                );
                setState(() {
                  myorderlist.add(myorderclass);
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
      body: Column(
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
          Expanded(
              child: myorderlist.length == 0
                  ?
              Center(
                child: new Text(
                  "لا يوجد بيانات",
                ),
              )
//              new Center(
//                      child: loadingIndicator,
//                    )
                  : new ListView.builder(
                      physics: BouncingScrollPhysics(),
                      controller: _controller,
                      itemCount: myorderlist.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return InkWell(
                          child: _firebasedata(
                            index,
                            myorderlist.length,
                            myorderlist[index].Uid,
                            myorderlist[index].wid,
                            myorderlist[index].pid,
                            myorderlist[index].Name,
                            myorderlist[index].title,
                            myorderlist[index].statusOrder,
                            myorderlist[index].cadv,
                            myorderlist[index].curl,
                            myorderlist[index].cType,
                          ),
                        );
                      })),
        ],
      ),
    );
  }

  Widget _firebasedata(
    int position,
    int length,
    String Uid,
    String wid,
    String pid,
    String Name,
    String titel,
    String statusOrder,
    String cadv,
    String curl,
    String cType,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.grey[300],
        shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0)),
        //borderOnForeground: true,
        elevation: 10.0,
        margin: EdgeInsets.only(right: 1, left: 1, bottom: 2),
        child: InkWell(
          onTap: () {
            setState(() {});
          },
          child: Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 225,
                          child: Text(
                            " $titel",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.blue,
                                fontFamily: 'Gamja Flower',
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                        Container(
                          width: 225,
                          child: Text(
                            " $Name",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,

                              //    fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Container(
                          width: 225,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                width: 100,
                              ),
                              Text(
                                " $cadv",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontFamily: 'Gamja Flower',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    fontStyle: FontStyle.normal),
                              ),
                              Text(
                                ": نوع الطلب",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontFamily: 'Gamja Flower',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    fontStyle: FontStyle.normal),
                              ),
                            ],
                          ),
                        ),
                        Container(

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                width: 100,
                              ),
                              Text(
                                " $statusOrder",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: statusOrder == "قيد الانتظار"
                                      ? Colors.blue
                                      : statusOrder == "مقبول"
                                          ? Colors.green
                                          : Colors.red,
                                  fontSize: 13,
                                  //    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                ": حالة الطلب",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontFamily: 'Gamja Flower',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    fontStyle: FontStyle.normal),
                              ),
                            ],
                          ),
                        ),
                        cType == "provider"
                            ? Row(
                                //  crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      width:
                                          100 /*MediaQuery.of(context).size.width*/,
                                      height: 40,
                                      child: new RaisedButton(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            new Text("قبول"),
                                            SizedBox(
                                              height: _minimumPadding,
                                              width: _minimumPadding,
                                            ),
                                            Icon(
                                              Icons.check,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                        textColor: Colors.white,
                                        color: Colors.green,
                                        onPressed: () async {
                                          FirebaseDatabase.instance
                                              .reference()
                                              .child("MyOrder")
                                              .child(Uid)
                                              .child(pid)
                                              .update({
                                            "statusOrder": "مقبول",
                                          }).then((_) {
                                            FirebaseDatabase.instance
                                                .reference()
                                                .child("MyOrder")
                                                .child(wid)
                                                .child(pid)
                                                .update({
                                              "statusOrder": "مقبول",
                                            }).then((_) {
                                              setState(() {
                                                myorderlist[position]
                                                    .statusOrder = "مقبول";
                                              });
                                            });
                                          });
                                        },
//
                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    100.0)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      width:
                                          100 /*MediaQuery.of(context).size.width*/,
                                      height: 40,
                                      child: new RaisedButton(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            new Text("رفض"),
                                            SizedBox(
                                              height: _minimumPadding,
                                              width: _minimumPadding,
                                            ),
                                            Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                        textColor: Colors.white,
                                        color: Colors.red,
                                        onPressed: () async {
                                          FirebaseDatabase.instance
                                              .reference()
                                              .child("MyOrder")
                                              .child(Uid)
                                              .child(pid)
                                              .update({
                                            "statusOrder": "مرفوض",
                                          }).then((_) {
                                            FirebaseDatabase.instance
                                                .reference()
                                                .child("MyOrder")
                                                .child(wid)
                                                .child(pid)
                                                .update({
                                              "statusOrder": "مرفوض",
                                            }).then((_) {
                                              setState(() {
                                                myorderlist[position]
                                                    .statusOrder = "مرفوض";
                                              });
                                            });
                                          });
                                        },
//
                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    100.0)),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : Container(),
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
