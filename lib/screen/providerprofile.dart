import 'dart:io';

import 'package:advancednaql/classes/CommentClass.dart';
import 'package:advancednaql/classes/OrderClass.dart';
import 'package:advancednaql/classes/OrderDetailClass.dart';
import 'package:advancednaql/translation/app_localizations.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:url_launcher/url_launcher.dart';

//import 'package:simple_slider/simple_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:connectivity/connectivity.dart';

import 'ModelsForChating/chat.dart';
import 'allorder.dart';

class providerProlile extends StatefulWidget {
  String cId;
  String cName;
  String cDateID;

  providerProlile(this.cId, this.cDateID, this.cName);

  @override
  _providerProlileState createState() => _providerProlileState();
}

class _providerProlileState extends State<providerProlile> {
  String _userId;
  String _username;
  var _formKey1 = GlobalKey<FormState>();
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  Future<void> _launched;
  var _controller = ScrollController();
  bool favcheck = false;

  //List<OrderDetailClass> orderlist = [];
  List<CommentClass> commentlist = [];

  //var _controller = ScrollController();

  OrderDetailClass orderclass;
  final double _minimumPadding = 5.0;
  bool _load = false;
  String cPhone;
  TextEditingController _commentController = TextEditingController();
  List<String> _imageUrls;

  @override
  void initState() {
    super.initState();
    final userdatabaseReference =
        FirebaseDatabase.instance.reference().child("userdata");
    userdatabaseReference
        .child(
          widget.cId,
        )
        .child("cPhone")
        .once()
        .then((DataSnapshot snapshot5) {
      setState(() {
        if (snapshot5.value != null) {
          setState(() {
            cPhone = snapshot5.value;
          });
        }
      });
    });
    final commentdatabaseReference = FirebaseDatabase.instance
        .reference()
        .child("commentsdata")
        .child(widget.cId)
        .child(widget.cDateID);
    commentdatabaseReference.once().then((DataSnapshot snapshot) {
      var KEYS = snapshot.value.keys;
      var DATA = snapshot.value;
      //Toast.show("${snapshot.value.keys}",context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);

      commentlist.clear();

      for (var individualkey in KEYS) {
        // if (!blockList.contains(individualkey) &&user.uid != individualkey) {
        CommentClass commentclass = new CommentClass(
          DATA[individualkey]['cId'],
          DATA[individualkey]['cuserid'],
          DATA[individualkey]['cdate'],
          DATA[individualkey]['cheaddate'],
          DATA[individualkey]['ccoment'],
          DATA[individualkey]['cname'],
          DATA[individualkey]['cadvID'],

        );

        setState(() {
          commentlist.add(commentclass);
//              Toast.show("${favchecklist.length}/${coiffurelist.length}",context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);
        });
        // }
      }
    });
    FirebaseAuth.instance.currentUser().then((user) => user == null
        ? setState(() {
            setState(() {
              favcheck = false;
            });
            //_userId = user.uid;

            /////////////////////////////////////
            final orderdatabaseReference =
                FirebaseDatabase.instance.reference().child("orderdata");

            orderdatabaseReference
                .child(widget.cId)
                .child(widget.cDateID)
                .once()
                .then((DataSnapshot data1) {
              var DATA = data1.value;
              setState(() {
                orderclass = new OrderDetailClass(
                  DATA['cId'],
                  DATA['cdate'],
                  DATA['clat1'],
                  DATA['clong1'],
                  DATA['clat2'],
                  DATA['clong2'],
                  DATA['cType'],
                  DATA['cCategory'],
                  DATA['cpayload'],
                  DATA['cnocars'],
                  DATA['ctime'],
                  DATA['cpublished'],
                  DATA['cstarttraveltime'],
                  DATA['curi'],
                  ////
                  DATA['ccity'],
                  DATA['cadv'],
                  DATA['ctitle'],
                  DATA['ccompany'],
                  DATA['cowner'],
                  DATA['cmodel'],
                  DATA['cdriver'],
                  DATA['cshort'],
                  DATA['cdetail'],
                  DATA['curilist'],
                );
                _imageUrls = DATA['curilist']
                    .replaceAll(" ", "")
                    .replaceAll("[", "")
                    .replaceAll("]", "")
                    .split(",");
              });
            });
          })
        : setState(() {
            _userId = user.uid;
            userdatabaseReference
                .child(
                  _userId,
                )
                .child("cName")
                .once()
                .then((DataSnapshot snapshot) {
              setState(() {
                if (snapshot.value != null) {
                  setState(() {
                    _username = snapshot.value;
                  });
                }
              });
            });

            //  Toast.show(_userId,context,duration: Toast.LENGTH_SHORT,gravity:  Toast.BOTTOM);

            final databaseFav =
                FirebaseDatabase.instance.reference().child("userFavourits");
            databaseFav
                .child(_userId)
                .child(widget.cId + widget.cDateID)
                .child("FavChecked")
                .once()
                .then((DataSnapshot snapshot5) {
              setState(() {
                if (snapshot5.value != null) {
                  setState(() {
                    favcheck = snapshot5.value;
                  });
                } else {
                  setState(() {
                    favcheck = false;
                  });
                }
              });
            });
            /////////////////////////////////////
            final orderdatabaseReference =
                FirebaseDatabase.instance.reference().child("orderdata");

            orderdatabaseReference
                .child(widget.cId)
                .child(widget.cDateID)
                .once()
                .then((DataSnapshot data1) {
              var DATA = data1.value;
              setState(() {
                orderclass = new OrderDetailClass(
                  DATA['cId'],
                  DATA['cdate'],
                  DATA['clat1'],
                  DATA['clong1'],
                  DATA['clat2'],
                  DATA['clong2'],
                  DATA['cType'],
                  DATA['cCategory'],
                  DATA['cpayload'],
                  DATA['cnocars'],
                  DATA['ctime'],
                  DATA['cpublished'],
                  DATA['cstarttraveltime'],
                  DATA['curi'],
                  ////
                  DATA['ccity'],
                  DATA['cadv'],
                  DATA['ctitle'],
                  DATA['ccompany'],
                  DATA['cowner'],
                  DATA['cmodel'],
                  DATA['cdriver'],
                  DATA['cshort'],
                  DATA['cdetail'],
                  DATA['curilist'],
                );
                _imageUrls = DATA['curilist']
                    .replaceAll(" ", "")
                    .replaceAll("[", "")
                    .replaceAll("]", "")
                    .split(",");
              });
            });
          }));
  }

  @override
  Widget build(BuildContext context) {
//    Widget loadingIndicator = _load
//        ? new Container(
//      child: SpinKitCircle(color: Colors.blue),
//    )
//        : new Container();
    TextStyle textStyle = Theme.of(context).textTheme.subtitle;

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
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: 20,
                    height: 20,
                    child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back)),
                  ),
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
          Form(
            key: _formKey1,
            child: Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding * 20,
                    bottom: _minimumPadding * 0,
                    right: _minimumPadding * 0,
                    left: _minimumPadding * 0),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    //getImageAsset(),

                    Container(
                      //color: Colors.grey[200],
                        width: 300,
                        height: 200,
                        child: _imageUrls == null
                            ? SpinKitThreeBounce(
                          size: 35,
                          color: Colors.blue,
                        )
                            : Swiper(
                          loop: false,
                          duration: 1000,
                          autoplay: true,
                          autoplayDelay: 15000,
                          itemCount: _imageUrls.length,
                          pagination: new SwiperPagination(
                            margin: new EdgeInsets.fromLTRB(
                                0.0, 0.0, 0.0, 0.0),
                            builder: new DotSwiperPaginationBuilder(
                                color: Colors.grey,
                                activeColor: Colors.blue,
                                size: 8.0,
                                activeSize: 8.0),
                          ),
                          control: new SwiperControl(),
                          viewportFraction: 1,
                          scale: 0.1,
                          outer: true,
                          itemBuilder:
                              (BuildContext context, int index) {
                            return Image.network(_imageUrls[index],
                                fit: BoxFit.fill,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return SpinKitThreeBounce(
                                    color: Colors.blue,
                                    size: 35,
                                  );
                                });
                          },
                        )),
                    Card(
                      shape: new RoundedRectangleBorder(
                          side: new BorderSide(
                              color: Colors.grey[400], width: 3.0),
                          borderRadius: BorderRadius.circular(10.0)),
                      //borderOnForeground: true,
                      elevation: 10.0,
                      margin: EdgeInsets.only(right: 1, left: 1, bottom: 2),
                      child: Container(
                          height: 110,
                          color: Colors.grey[300],
                          padding: EdgeInsets.all(0),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              new Positioned(
                                  top: 30,
                                  left: 15,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        setState(() {
                                          favcheck =
                                          !favcheck; //boolean value
                                        });
                                        if (_userId == null) {
                                          //if(favchecklist[position] ){
                                          Toast.show(
                                              "يجب عليك تسجيل الدخول أولا",
                                              context,
                                              duration: Toast.LENGTH_LONG,
                                              gravity: Toast.BOTTOM);
                                          setState(() {
                                            favcheck = false; //boolean value
                                          });
                                        } else {
                                          DateTime now = DateTime.now();
                                          String b = now.month.toString();
                                          if (b.length < 2) {
                                            b = "0" + b;
                                          }
                                          String c = now.day.toString();
                                          if (c.length < 2) {
                                            c = "0" + c;
                                          }
                                          String d = now.hour.toString();
                                          if (d.length < 2) {
                                            d = "0" + d;
                                          }
                                          String e = now.minute.toString();
                                          if (e.length < 2) {
                                            e = "0" + e;
                                          }
                                          String f = now.second.toString();
                                          if (f.length < 2) {
                                            f = "0" + f;
                                          }

//////////*******************************************
                                          final databasealarm =
                                          FirebaseDatabase.instance
                                              .reference()
                                              .child("Alarm")
                                              .child(widget.cId);
                                          final databaseFav = FirebaseDatabase
                                              .instance
                                              .reference()
                                              .child("userFavourits")
                                              .child(_userId)
                                              .child(widget.cId +
                                              widget.cDateID);
                                          if (favcheck) {
                                            databaseFav.set({
                                              'cId': widget.cId,
                                              'FavChecked': favcheck,
                                              'cDateID': widget.cDateID,
                                            });
                                            databasealarm.push().set({
                                              'alarmid':
                                              databasealarm.push().key,
                                              'wid': widget.cId,
                                              'Name': _username,
                                              'cType': "love",
                                              'cDateID':
                                              "${now.year.toString()}-${b}-${c} ${d}:${e}:${f}",
                                              'arrange': int.parse(
                                                  "${now.year.toString()}${b}${c}${d}${e}${f}")
                                            });
                                            Toast.show(
                                                "${widget.cName}تم اضافتة فى المفضلة ",
                                                context,
                                                duration: Toast.LENGTH_SHORT,
                                                gravity: Toast.BOTTOM);
                                          } else {
                                            databaseFav.set(null);

                                            Toast.show("تم الحذف فى المفضلة",
                                                context,
                                                duration: Toast.LENGTH_SHORT,
                                                gravity: Toast.BOTTOM);
                                          }

                                          ////////////////*************************
                                        }
                                      });
                                    },
                                    child: Container(
                                      //decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, bottom: 10.0),
                                        child: favcheck
                                            ? Icon(
                                          Icons.favorite,
                                          size: 40.0,
                                          color: Colors.red,
                                        )
////
                                            : Column(
                                          children: <Widget>[
                                            Icon(
                                              Icons.favorite_border,
                                              size: 40.0,
                                              color: Colors.red,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )),
                              Positioned(
                                top: 0,
                                right: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: orderclass == null
                                      ? Text("")
                                      : Text(
                                    "شاحنة ${orderclass.cCategory} حمولة ${orderclass.cpayload}",
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
                                top: 8,
                                left: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: <Widget>[
                                      orderclass == null
                                          ? Text("")
                                          : Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0),
                                        child: Text(
                                          "خلال: ${orderclass.cmodel}",
                                          textDirection:
                                          TextDirection.rtl,
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontFamily:
                                              'Gamja Flower',
                                              fontStyle:
                                              FontStyle.normal),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 20,
                                right: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: <Widget>[
                                      orderclass == null
                                          ? Text("")
                                          : Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0),
                                        child: Text(
                                          "المالك: ${widget.cName}",
                                          textDirection:
                                          TextDirection.rtl,
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontFamily:
                                              'Gamja Flower',
                                              fontStyle:
                                              FontStyle.normal),
                                        ),
                                      ),
                                      Icon(
                                        Icons.person,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 45,
                                right: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: <Widget>[
                                      orderclass == null
                                          ? Text("")
                                          : Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0),
                                        child: Text(
                                          "الماركة: ${orderclass.ccompany}",
                                          textDirection:
                                          TextDirection.rtl,
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontFamily:
                                              'Gamja Flower',
                                              fontStyle:
                                              FontStyle.normal),
                                        ),
                                      ),
                                      Icon(
                                        Icons.drive_eta,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 70,
                                right: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: <Widget>[
                                      orderclass == null
                                          ? Text("")
                                          : Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0),
                                        child: Text(
                                          "الموديل: ${orderclass.cmodel}",
                                          textDirection:
                                          TextDirection.rtl,
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontFamily:
                                              'Gamja Flower',
                                              fontStyle:
                                              FontStyle.normal),
                                        ),
                                      ),
                                      Icon(
                                        Icons.calendar_today,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 70,
                                left: 5,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: <Widget>[
                                      orderclass == null
                                          ? Text("")
                                          : Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8.0),
                                        child: Text(
                                          "من:${orderclass.clat1} إلى: ${orderclass.clat2}",
                                          textDirection:
                                          TextDirection.rtl,
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontFamily:
                                              'Gamja Flower',
                                              fontStyle:
                                              FontStyle.normal),
                                        ),
                                      ),
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: orderclass == null
                            ? Text("")
                            : Text(
                          orderclass.cdetail,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: 'Gamja Flower',
                              fontStyle: FontStyle.normal),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        width: 300 /*MediaQuery.of(context).size.width*/,
                        height: 40,
                        child: new RaisedButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Text("الطلب"),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),

                          textColor: Colors.white,
                          color: const Color(0xff43A2CC),
                          onPressed: () {
                            if (_userId == null) {
                              Toast.show(
                                  "يجب عليك تسجيل الدخول أولا", context,
                                  duration: Toast.LENGTH_LONG,
                                  gravity: Toast.BOTTOM);
                            } else {
                              final databasemyorder = FirebaseDatabase
                                  .instance
                                  .reference()
                                  .child("MyOrder")
                                  .child(widget.cId);
                              final databasemyorder2 = FirebaseDatabase
                                  .instance
                                  .reference()
                                  .child("MyOrder")
                                  .child(_userId);
                              String pid = databasemyorder.push().key;
                              showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                new CupertinoAlertDialog(
                                  title: new Text("تنبية"),
                                  content:
                                  new Text("سوف يتم إرسال طلبك الان ؟"),
                                  actions: [
                                    CupertinoDialogAction(
                                        isDefaultAction: false,
                                        child: new FlatButton(
                                          onPressed: () => databasemyorder.child(pid)
                                              .set({
                                            'Uid': _userId,
                                            'wid': widget.cId,
                                            'pid': pid,

                                            'Name': _username,
                                            'title':
                                            "شاحنة ${orderclass.cCategory} حمولة ${orderclass.cpayload}",
                                            'statusOrder': "قيد الانتظار",
                                            'cadv': "${orderclass.cadv}",
                                            'curl': "${orderclass.curi}",
                                            'cType': "provider",
                                          }).whenComplete(() =>
                                              databasemyorder2.child(pid)
                                              // .child(widget.cId)
                                                  .set({
                                                'Uid': _userId,
                                                'wid': widget.cId,
                                                'pid': pid,
                                                'Name': widget.cName,
                                                'title':
                                                "شاحنة ${orderclass.cCategory} حمولة ${orderclass.cpayload}",
                                                'statusOrder': "قيد الانتظار",
                                                'cadv':
                                                "${orderclass.cadv}",
                                                'curl':
                                                "${orderclass.curi}",
                                                'cType': "user",
                                              })).then((value) => Navigator.pop(context)),
                                          child: Text("موافق"),
                                        )),
                                    CupertinoDialogAction(
                                        isDefaultAction: false,
                                        child: new FlatButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("إلغاء"),
                                        )),
                                  ],
                                ),
                              );

//                                Navigator.push(
//                                  context,
//                                  new MaterialPageRoute(
//                                      builder: (BuildContext context) =>
//                                      new ChatPage(
//                                          name:  widget.cName,
//                                          uid: widget.cId
//                                      )),
//                                );
                            }
                          },
//
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2 * _minimumPadding,
                      width: _minimumPadding,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Container(
                            width: 150 /*MediaQuery.of(context).size.width*/,
                            height: 40,
                            child: new RaisedButton(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  new Text(
                                    "تواصل عبر الدردشة",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 10,
                                    ),
                                  ),
                                  Icon(
                                    Icons.mail_outline,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                              textColor: Colors.black54,
                              color: Colors.grey[400],
                              onPressed: () {
                                if (_userId == null) {
                                  Toast.show(
                                      "يجب عليك تسجيل الدخول أولا", context,
                                      duration: Toast.LENGTH_LONG,
                                      gravity: Toast.BOTTOM);
                                } else {
                                  Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                        new ChatPage(
                                            name: widget.cName,
                                            uid: widget.cId)),
                                  );
                                }
                              },

//
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                  new BorderRadius.circular(10.0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Container(
                            width: 150 /*MediaQuery.of(context).size.width*/,
                            height: 40,
                            child: new RaisedButton(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  new Text(
                                    "تواصل برقم الجوال",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 10,
                                    ),
                                  ),
                                  Icon(
                                    Icons.phone,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                              textColor: Colors.black54,
                              color: Colors.grey[400],
                              onPressed: () {
                                if (_userId == null) {
                                  Toast.show(
                                      "يجب عليك تسجيل الدخول أولا", context,
                                      duration: Toast.LENGTH_LONG,
                                      gravity: Toast.BOTTOM);
                                } else {
                                  if (cPhone != null) {
                                    _makePhoneCall('tel:$cPhone');
                                  } else {
                                    Toast.show("حاول مرة اخرى", context,
                                        duration: Toast.LENGTH_LONG,
                                        gravity: Toast.BOTTOM);
                                  }
                                }
                              },
//
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                  new BorderRadius.circular(10.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2 * _minimumPadding,
                      width: _minimumPadding,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Container(
                            width: 150 /*MediaQuery.of(context).size.width*/,
                            height: 40,
                            child: new RaisedButton(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  new Text(
                                    "مشاركة عبر التطبيق",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 10,
                                    ),
                                  ),
                                  Icon(
                                    Icons.exit_to_app,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                              textColor: Colors.black54,
                              color: Colors.grey[400],
                              onPressed: () {},
//
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                  new BorderRadius.circular(10.0)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Container(
                            width: 150 /*MediaQuery.of(context).size.width*/,
                            height: 40,
                            child: new RaisedButton(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  new Text(
                                    "تواصل عن طريق الواتساب",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 8,
                                    ),
                                  ),
                                  Icon(
                                    Icons.call,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                              textColor: Colors.black54,
                              color: Colors.grey[400],
                              onPressed: () {
                                if (_userId == null) {
                                  Toast.show(
                                      "يجب عليك تسجيل الدخول أولا", context,
                                      duration: Toast.LENGTH_LONG,
                                      gravity: Toast.BOTTOM);
                                } else {
                                  if (cPhone != null) {
                                    //var phone="01003208785";
                                    var whatsappUrl =
                                        "whatsapp://send?phone=+2$cPhone";
                                    canLaunch(whatsappUrl) != null
                                        ? launch(whatsappUrl)
                                        : print(
                                        "open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
                                  } else {
                                    Toast.show("حاول مرة اخرى", context,
                                        duration: Toast.LENGTH_LONG,
                                        gravity: Toast.BOTTOM);
                                  }
                                }
                              },

//
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                  new BorderRadius.circular(10.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2 * _minimumPadding,
                      width: _minimumPadding,
                    ),
                    Card(

                      shape: new RoundedRectangleBorder(
                          side: new BorderSide(color:Colors.grey[400], width: 3.0),
                          borderRadius: BorderRadius.circular(10.0)),
                      //borderOnForeground: true,
                      elevation: 10.0,
                      margin: EdgeInsets.only(right: 1, left: 1, bottom: 2),
                      child: Container(
                          height: 330,
                          color: Colors.grey[300],
                          padding: EdgeInsets.all(0),
                          child: Column(
                            // alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              commentlist.length == 0
                                  ? Center(
                                child: new Text(
                                  "لا يوجد بيانات",
                                ),)
                                  :
                              Flexible(
                                  child: new ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      controller: _controller,
                                      itemCount: commentlist.length,
                                      itemBuilder: (BuildContext ctxt, int index) {
                                        return _firebasedata(
                                          index,
                                          commentlist.length,
                                          commentlist[index].cId,
                                          commentlist[index].cuserid,
                                          commentlist[index].cdate,
                                          commentlist[index].cheaddate,
                                          commentlist[index].ccoment,
                                          commentlist[index].cname,
                                          commentlist[index].cadvID,
                                        );
                                      })

                              ),





                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child:  Row(
                                  children: <Widget>[
                                    Container(
                                      width: 320,
                                      height: 60,
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
                                            child: TextFormField(
                                              textAlign: TextAlign.right,
                                              keyboardType: TextInputType.text,
                                              textDirection: TextDirection.rtl,
                                              controller: _commentController,
                                              validator: (String value) {
                                                if ((value.isEmpty)) {
                                                  return 'برجاء ادخال التعليق';
                                                }
                                              },

                                              onChanged: (value) {},
                                              //  controller: controller,
                                              decoration: InputDecoration(
                                                  errorStyle: TextStyle(color: Colors.red, fontSize: 15.0),
                                                  labelText: "التعليق",
                                                  // hintText: "التعليق",

//                                prefixIcon: Icon(
//                                  Icons.phone_iphone,
//                                  color: Colors.pinkAccent,
//                                ),
                                                  border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.all(
                                                          Radius.circular(5.0)))
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        if (_formKey1.currentState.validate()) {
                                          try {
                                            final result = await InternetAddress.lookup('google.com');
                                            if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                                              createRecord();

                                            }
                                          } on SocketException catch (_) {
                                            //  print('not connected');
                                            Toast.show(Translations.of(context).translate('please_see_network_connection'),context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);

                                          }
//                                                setState(() {
//                                                  _load2 = true;
//                                                });


                                        }

                                      },
                                      child: Icon(
                                        Icons.add_comment,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),





                              ),






                            ],
                          )),
                    ),
                  ],
                )),
          ),

        ],
      ),
    );
  }

  void createRecord() {
//    DateTime now = DateTime.now();
//    String b=now.month.toString();
//    if(b.length<2){b="0"+b;}
//    String c=now.day.toString();
//    if(c.length<2){c="0"+c;}
//    String d=now.hour.toString();
//    if(d.length<2){d="0"+d;}
//    String e=now.minute.toString();
//    if(e.length<2){e="0"+e;}
//    String f=now.second.toString();
//    if(f.length<2){f="0"+f;}
//    final databasealarm = FirebaseDatabase
//        .instance
//        .reference()
//        .child("Alarm")
//        .child(widget.cId);

    final userdatabaseReference =
        FirebaseDatabase.instance.reference().child("userdata");
    userdatabaseReference
        .child(_userId)
        .child("cName")
        .once()
        .then((DataSnapshot snapshot5) {
      setState(() {
        if (snapshot5.value != null) {
          setState(() {
            DateTime now = DateTime.now();

            // String date1 ='${now.year}-${now.month}-${now.day}';// ${now.hour}:${now.minute}:00.000';
            String date =
                '${now.year}-${now.month}-${now.day}-${now.hour}-${now.minute}-00';
            final commentbaseReference =
                FirebaseDatabase.instance.reference().child("commentsdata");
            commentbaseReference
                .child(widget.cId)
                .child(widget.cDateID)
                .child(_userId + date)
                .set({
              'cId': widget.cId,
              'cuserid': _userId,
              'cdate': now.toString(),
              'cheaddate': _userId + date,
              'ccoment': _commentController.text,
              'cname': snapshot5.value,
              'cadvID': widget.cDateID,

            }).whenComplete(() {
              Toast.show("تم التعليق بنجاح", context,
                  duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
              CommentClass commentclass = new CommentClass(
                widget.cId,
                _userId,
                now.toString(),
                _userId + date,
                _commentController.text,
                snapshot5.value,
                widget.cDateID,

              );
              setState(() {
                commentlist.add(commentclass);
                _commentController.text = "";
                //      var cursor = (5/commentlist.length)* _controller.position.maxScrollExtent;//specific item

                _controller.animateTo(
                  // NEW
                  _controller.position.maxScrollExtent * 1.2, // NEW
                  duration: const Duration(milliseconds: 500), // NEW
                  curve: Curves.ease, // NEW
                );
              });
              /**
                  databasealarm.push().set({
                  'alarmid': databasealarm.push().key,
                  'wid': widget.cId,
                  'Name': snapshot5.value,
                  'cType': "profilecomment",
                  'cDateID':"${now.year.toString()}-${b}-${c} ${d}:${e}:${f}",
                  'arrange':int.parse("${now.year.toString()}${b}${c}${d}${e}${f}")
                  }).whenComplete(() {

                  Toast.show("تم التعليق بنجاح",context,duration: Toast.LENGTH_LONG,gravity:  Toast.BOTTOM);
                  CommentClass commentclass =
                  new CommentClass(
                  widget.cId,
                  _userId,
                  now.toString(),
                  _userId+date,
                  _commentController.text,
                  snapshot5.value,
                  );
                  setState(() {
                  commentlist.add(commentclass);
                  _commentController.text="";
                  //      var cursor = (5/commentlist.length)* _controller.position.maxScrollExtent;//specific item

                  _controller.animateTo(                                      // NEW
                  _controller.position.maxScrollExtent*1.1,                     // NEW
                  duration: const Duration(milliseconds: 500),                    // NEW
                  curve: Curves.ease,                                             // NEW
                  );
                  });
                  });

               **/
              //  _controller.animateTo(0.0,curve: Curves.easeInOut, duration: Duration(seconds: 1));
            }).catchError((e) {
              Toast.show(e, context,
                  duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
              setState(() {
                //  _load2 = false;
              });
            });
          });
        }
      });
    });

    // })
    // );
  }

  Widget _firebasedata(
      index,
      length,
      cId,
      cuserid,
      cdate,
      cheaddate,
      ccoment,
      cname,
      cadvID,

      ) {
    return Padding(
      padding: const EdgeInsets.only(top:5.0,right: 5.0, left: 5.0),
      child: Card(
        shape: new RoundedRectangleBorder(
            side: new BorderSide(color: Colors.grey, width: 3.0),
            borderRadius: BorderRadius.circular(10.0)),
        //borderOnForeground: true,
        elevation: 10.0,
        margin: EdgeInsets.all(1),
        child: InkWell(
          onTap: () {

          },
          child: Container(
              padding: EdgeInsets.all(8),
              child: Container(
                  width:350 ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: <Widget>[
                      _userId==commentlist[index].cuserid? FlatButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                            new CupertinoAlertDialog(
                              title: new Text("تنبية"),
                              content:
                              new Text("سوف يتم حذف تعليقك؟"),
                              actions: [
                                CupertinoDialogAction(
                                    isDefaultAction: false,
                                    child: new FlatButton(
                                      onPressed: () {
                                        setState(() {

                                          print("kkkkkkkkkkkk");
                                          if(_userId==commentlist[index].cuserid){
                                            FirebaseDatabase.instance
                                                .reference()
                                                .child("commentsdata")
                                                .child(widget.cId).child(cadvID)
                                                .child(commentlist[index].cheaddate)
                                                .remove()
                                                .whenComplete(() {

                                              setState(() {
                                                commentlist.removeAt(index);
                                              });
                                              Toast.show("تم حذف التعليق", context,
                                                  duration: Toast.LENGTH_SHORT,
                                                  gravity: Toast.BOTTOM);
                                            }).then((value) => Navigator.pop(context));
                                          }
                                          else{
                                            Toast.show("ليس تعليقك", context,
                                                duration: Toast.LENGTH_SHORT,
                                                gravity: Toast.BOTTOM);
                                          }
                                          //   }),
//            Navigator.push(
//                context,
//                MaterialPageRoute(
//                    builder: (context) =>
//                        CoifUserProlile(cId, curi, cName, _userId)));
                                        });
                                      }
//                                      => databasemyorder.child(pid)
//                                          .set({
//                                        'Uid': _userId,
//                                        'wid': widget.cId,
//                                        'pid': pid,
//
//                                        'Name': _username,
//                                        'title':
//                                        "شاحنة ${orderclass.cCategory} حمولة ${orderclass.cpayload}",
//                                        'statusOrder': "قيد الانتظار",
//                                        'cadv': "${orderclass.cadv}",
//                                        'curl': "${orderclass.curi}",
//                                        'cType': "provider",
//                                      }).whenComplete(() =>
//                                          databasemyorder2.child(pid)
//                                          // .child(widget.cId)
//                                              .set({
//                                            'Uid': _userId,
//                                            'wid': widget.cId,
//                                            'pid': pid,
//                                            'Name': widget.cName,
//                                            'title':
//                                            "شاحنة ${orderclass.cCategory} حمولة ${orderclass.cpayload}",
//                                            'statusOrder': "قيد الانتظار",
//                                            'cadv':
//                                            "${orderclass.cadv}",
//                                            'curl':
//                                            "${orderclass.curi}",
//                                            'cType': "user",
//                                          })).then((value) => Navigator.pop(context)),
                                      ,child: Text("موافق"),
                                    )),
                                CupertinoDialogAction(
                                    isDefaultAction: false,
                                    child: new FlatButton(
                                      onPressed: () =>
                                          Navigator.pop(context),
                                      child: Text("إلغاء"),
                                    )),
                              ],
                            ),
                          );
                          //ResetPasswordDialog();
                          //FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text);
                        },
                        child:  Icon(
                          Icons.more_vert,
                          color: Colors.black,
                        ),
                      ):Container(),

                      Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: <Widget>[

                                Container(
                                  width:200,
                                  child: Align(
                                      alignment: Alignment.topRight,
                                      child: Text(cname,
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 15,
                                        ),
                                        textDirection: TextDirection.rtl,)),
                                ),
                                Icon(
                                  Icons.person,
                                  size: 25,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:2.0, right: 0.0,bottom: 2,left: 2.0),
                            child:Align(
                                alignment: Alignment.topRight,
                                child: Text(ccoment,textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),)),
                          ),
                        ],
                      ),
                    ],
                  )
              )),
        ),
      ),
    );
  }
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
